module Companies.ViewSpec exposing (..)

import Companies.View exposing (renderCompany, renderCompanies)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Test exposing (..)
import Html.Attributes as Attributes
import Expect


tests : Test
tests =
    let
        validCompany =
            { name = "Cruel Company"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            }
    in
        describe "Companies"
            [ test "that company title is render correctly" <|
                \() ->
                    Query.has [ Selector.text validCompany.name ] <|
                        Query.find [ Selector.tag "h2" ] <|
                            Query.fromHtml <|
                                renderCompany validCompany
            , test "that company image is render correctly" <|
                \() ->
                    Query.has [ Selector.attribute <| Attributes.src validCompany.image ] <|
                        Query.find [ Selector.tag "img" ] <|
                            Query.fromHtml <|
                                renderCompany validCompany
            , test "that company link is render correctly" <|
                \() ->
                    Query.has
                        [ Selector.attribute <|
                            Attributes.href validCompany.link
                        , Selector.text
                            "Fonte"
                        ]
                    <|
                        Query.find [ Selector.class "company-reference" ] <|
                            Query.fromHtml <|
                                renderCompany validCompany
            , test "that company twitter is render correctly" <|
                \() ->
                    Query.has [ Selector.attribute <| Attributes.href validCompany.twitter ] <|
                        Query.find [ Selector.class "company-twitter" ] <|
                            Query.fromHtml <|
                                renderCompany validCompany
            , test "that the company render has a identification class" <|
                \() ->
                    Query.has [ Selector.class "company-item" ] <|
                        Query.fromHtml <|
                            renderCompany validCompany
            , test "that the company list render renders all companies" <|
                \() ->
                    let
                        renderedList =
                            Query.findAll [ Selector.class "company-item" ] <|
                                Query.fromHtml <|
                                    renderCompanies <|
                                        [ { validCompany | name = validCompany.name ++ " 1" }
                                        , { validCompany | name = validCompany.name ++ " 2" }
                                        , { validCompany | name = validCompany.name ++ " 3" }
                                        ]
                    in
                        Expect.all
                            [ Query.has [ Selector.text "Cruel Company 1" ]
                                << Query.find [ Selector.tag "h2" ]
                                << Query.index 0
                            , Query.has [ Selector.text "Cruel Company 2" ]
                                << Query.find [ Selector.tag "h2" ]
                                << Query.index 1
                            , Query.has [ Selector.text "Cruel Company 3" ]
                                << Query.find [ Selector.tag "h2" ]
                                << Query.index 2
                            , Query.count <|
                                Expect.equal 3
                            ]
                            renderedList
            ]
