module Page.CompanyList.ViewSpec exposing (..)

import Page.CompanyList.View
import Page.CompanyList.Models exposing (init)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Html.Attributes as Attributes
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
    in
        describe "Company List View"
            [ test "that the list of promotion is rendered with links" <|
                \() ->
                    let
                        companyListItems =
                            Query.findAll [ Selector.tag "li" ] <|
                                Query.find [ Selector.class "company-list" ] <|
                                    Query.fromHtml <|
                                        Page.CompanyList.View.render
                                            { init | companies = validCompanies }
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
                            companyListItems
            ]
