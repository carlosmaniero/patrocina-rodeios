module Search.SearchSpec exposing (..)

import Search.View exposing (search)
import Search.Update as Update
import Search.Msg as Msg
import Search.Init exposing (init)
import Msgs
import Page.Home.Msgs
import Search.Msg
import Html.Attributes as Attributes
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Test.Html.Event as Event
import Json.Encode as Encode exposing (Value)
import Expect


tests : Test
tests =
    let
        firstCompany =
            { name = "Cruel Company"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            , info = "This company sponsoring rodeos"
            , slug = "cruelcompany"
            }

        secondCompany =
            { name = "BBQ Food"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            , info = "This company sponsoring rodeos"
            , slug = "cruelcompany2"
            }

        thirdCompany =
            { name = "Cruel Music Band"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            , info = "This company sponsoring rodeos"
            , slug = "cruelcompany3"
            }

        validCompanies =
            [ firstCompany
            , secondCompany
            , thirdCompany
            ]

        searchDefault =
            search
                (Msgs.PageHome
                    << Page.Home.Msgs.Search
                    << Search.Msg.Input
                )
                (Msgs.PageHome
                    << Page.Home.Msgs.Search
                    << Search.Msg.Focus
                )
                (Msgs.PageHome
                    << Page.Home.Msgs.Search
                    << Search.Msg.KeyDown
                )
    in
        describe "Search"
            [ test "that search renders an text input with the given term" <|
                \() ->
                    Query.has [ Selector.attribute <| Attributes.value "Cruel Company" ] <|
                        Query.find [ Selector.tag "input" ] <|
                            Query.fromHtml <|
                                searchDefault
                                    { init | term = "Cruel Company", userSearching = True }
            , test "that search throws the search input event when user types" <|
                \() ->
                    Event.expect (Msgs.PageHome <| Page.Home.Msgs.Search <| Msg.Input "text-typed") <|
                        Event.simulate (Event.input "text-typed") <|
                            Query.find [ Selector.tag "input" ] <|
                                Query.fromHtml <|
                                    searchDefault
                                        { init | userSearching = True }
            , test "that search renders the label" <|
                \() ->
                    Query.has [ Selector.text "Find Companies" ] <|
                        Query.find [ Selector.tag "h2" ] <|
                            Query.fromHtml <|
                                searchDefault
                                    { init | label = "Find Companies", userSearching = True }
            , test "that search renders quick view given a result" <|
                \() ->
                    let
                        quickResult =
                            Query.findAll [ Selector.tag "li" ] <|
                                Query.find [ Selector.class "search-quick-view" ] <|
                                    Query.fromHtml <|
                                        searchDefault
                                            { init | result = validCompanies, userSearching = True }
                    in
                        Expect.all
                            [ Query.has
                                [ Selector.attribute <| Attributes.href "/company/cruelcompany/"
                                , Selector.text "Cruel Company"
                                ]
                                << Query.find [ Selector.tag "a" ]
                                << Query.index 0
                            , Query.has
                                [ Selector.attribute <| Attributes.href "/company/cruelcompany2/"
                                , Selector.text "BBQ Food"
                                ]
                                << Query.find [ Selector.tag "a" ]
                                << Query.index 1
                            , Query.has
                                [ Selector.attribute <| Attributes.href "/company/cruelcompany3/"
                                , Selector.text "Cruel Music Band"
                                ]
                                << Query.find [ Selector.tag "a" ]
                                << Query.index 2
                            , Query.count <|
                                Expect.equal 3
                            ]
                            quickResult
            , test "that search quick view is hidden given no result" <|
                \() ->
                    Query.count (Expect.equal 0) <|
                        Query.findAll [ Selector.tag "ul" ] <|
                            Query.fromHtml <|
                                searchDefault
                                    { init | result = [], userSearching = True, term = "Vegan Company" }
            , test "that search quick view is hidden when user is not searching" <|
                \() ->
                    Query.has [ Selector.class "hidden" ] <|
                        Query.find [ Selector.class "search-quick-view" ] <|
                            Query.fromHtml <|
                                searchDefault
                                    { init | userSearching = False }
            , test "that search throws the search focus true event when user enters the input field" <|
                \() ->
                    Event.expect (Msgs.PageHome <| Page.Home.Msgs.Search <| Msg.Focus True) <|
                        Event.simulate (Event.focus) <|
                            Query.find [ Selector.tag "input" ] <|
                                Query.fromHtml <|
                                    searchDefault
                                        { init | userSearching = False }
            , test "that search throws the search focus false event when user leaves the input field" <|
                \() ->
                    Event.expect (Msgs.PageHome <| Page.Home.Msgs.Search <| Msg.Focus False) <|
                        Event.simulate (Event.blur) <|
                            Query.find [ Selector.tag "input" ] <|
                                Query.fromHtml <|
                                    searchDefault
                                        { init | userSearching = True }
            , test "that search throws the keydown event when user types" <|
                \() ->
                    let
                        keyDownEvent =
                            Encode.object
                                [ ( "keyCode", Encode.int 13 )
                                ]
                    in
                        Event.expect (Msgs.PageHome <| Page.Home.Msgs.Search <| Msg.KeyDown 13) <|
                            Event.simulate (Event.custom "keydown" keyDownEvent) <|
                                Query.find [ Selector.tag "input" ] <|
                                    Query.fromHtml <|
                                        searchDefault
                                            { init | userSearching = True }
            , test "that given a selected company it is showed as active in the quick view" <|
                \() ->
                    Query.has [ Selector.class "active" ] <|
                        Query.index 0 <|
                            Query.findAll [ Selector.tag "li" ] <|
                                Query.fromHtml <|
                                    searchDefault
                                        { init | selectedCompany = Just firstCompany, result = validCompanies, userSearching = True }
            , test "that given a selected company its name is rendered in the input field" <|
                \() ->
                    Query.has [ Selector.attribute <| Attributes.value firstCompany.name ] <|
                        Query.find [ Selector.tag "input" ] <|
                            Query.fromHtml <|
                                searchDefault
                                    { init | selectedCompany = Just firstCompany, result = validCompanies, userSearching = True }
            , test "that given a search term and no result its render a message that this term was not found" <|
                \() ->
                    Query.has [ Selector.text "Não encontramos a empresa \"Vegan Company\"." ] <|
                        Query.find [ Selector.tag "p" ] <|
                            Query.find [ Selector.class "search-result-error-message" ] <|
                                Query.fromHtml <|
                                    searchDefault
                                        { init | result = [], term = "Vegan Company" }
            , test "that given a search term and no result its render a link for the company list" <|
                \() ->
                    Query.has [ Selector.attribute <| Attributes.href "/companies/" ] <|
                        Query.find [ Selector.class "search-result-error-message" ] <|
                            Query.fromHtml <|
                                searchDefault
                                    { init | result = [], term = "Vegan Company" }
            ]
