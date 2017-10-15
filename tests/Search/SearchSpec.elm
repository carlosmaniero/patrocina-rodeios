module Search.SearchSpec exposing (..)

import Search.View exposing (search)
import Search.Update as Update
import Search.Msg as Msg
import Msgs
import Html.Attributes as Attributes
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Test.Html.Event as Event
import Expect


tests : Test
tests =
    let
        firstCompany =
            { name = "Cruel Company"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            }

        secondCompany =
            { name = "BBQ Food"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            }

        thirdCompany =
            { name = "Cruel Music Band"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            }

        validCompanies =
            [ firstCompany
            , secondCompany
            , thirdCompany
            ]
    in
        describe "Search"
            [ test "that search renders an text input with the given term" <|
                \() ->
                    Query.has [ Selector.attribute <| Attributes.value "Cruel Company" ] <|
                        Query.find [ Selector.tag "input" ] <|
                            Query.fromHtml <|
                                search <|
                                    { term = "Cruel Company", result = [], label = "" }
            , test "that search throws the search input event when user types" <|
                \() ->
                    Event.expect ((Msgs.Search << Msg.Input) "a") <|
                        Event.simulate (Event.input "a") <|
                            Query.find [ Selector.tag "input" ] <|
                                Query.fromHtml <|
                                    search { term = "", result = [], label = "" }
            , test "that search renders the label" <|
                \() ->
                    Query.has [ Selector.text "Find Companies" ] <|
                        Query.find [ Selector.tag "h2" ] <|
                            Query.fromHtml <|
                                search { term = "", result = [], label = "Find Companies" }
            , test "that search renders quick view given a result" <|
                \() ->
                    let
                        quickResult =
                            Query.findAll [ Selector.tag "li" ] <|
                                Query.find [ Selector.class "search-quick-view" ] <|
                                    Query.fromHtml <|
                                        search { term = "", result = validCompanies, label = "Find Companies" }
                    in
                        Expect.all
                            [ Query.has [ Selector.text "Cruel Company" ]
                                << Query.index 0
                            , Query.has [ Selector.text "BBQ Food" ]
                                << Query.index 1
                            , Query.has [ Selector.text "Cruel Music Band" ]
                                << Query.index 2
                            , Query.count <|
                                Expect.equal 3
                            ]
                            quickResult
            , test "that search quick view is hidden given no result" <|
                \() ->
                    Query.has [ Selector.class "hidden" ] <|
                        Query.find [ Selector.class "search-quick-view" ] <|
                            Query.fromHtml <|
                                search { term = "", result = [], label = "Find Companies" }
            ]
