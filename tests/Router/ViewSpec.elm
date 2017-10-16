module Router.ViewSpec exposing (..)

import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Router.Model
import Router.View


tests : Test
tests =
    let
        firstCompany =
            { name = "Cruel Company"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            , slug = "cruelcompany"
            }

        secondCompany =
            { name = "BBQ Food"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            , slug = "cruelcompany2"
            }

        thirdCompany =
            { name = "Cruel Music Band"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            , slug = "cruelcompany3"
            }

        validCompanies =
            [ firstCompany
            , secondCompany
            , thirdCompany
            ]

        model =
            { header =
                { title = "Patrocina Rodeios" }
            , search =
                { term = ""
                , label = "Digite o nome da empresa e veja se há envolvimento com redeios"
                , result = []
                , userSearching = False
                }
            , loadingCompaniesFile = False
            , companies =
                validCompanies
            , router =
                { page = Router.Model.Home
                }
            }
    in
        describe "Router View"
            [ test "that home page is rendered when the current page is Home" <|
                \() ->
                    Query.has [ Selector.id "page-home" ] <|
                        Query.fromHtml <|
                            Router.View.renderPage model
            , test "that not found page is rendered when the current page is NotFound" <|
                \() ->
                    Query.has [ Selector.id "page-not-found" ] <|
                        Query.fromHtml <|
                            Router.View.renderPage { model | router = { page = Router.Model.NotFound } }
            , test "that company detail page is rendered given a correct company slug" <|
                \() ->
                    Query.has [ Selector.id "page-company" ] <|
                        Query.fromHtml <|
                            Router.View.renderPage { model | router = { page = Router.Model.CompanyDetail firstCompany.slug } }
            , test "that company detail page renders not found page given an incorrect company slug" <|
                \() ->
                    Query.has [ Selector.id "page-not-found" ] <|
                        Query.fromHtml <|
                            Router.View.renderPage { model | router = { page = Router.Model.CompanyDetail "company-not-found" } }
            , test "that it renders the loading page until the companies file be loaded" <|
                \() ->
                    Query.has [ Selector.id "page-loading" ] <|
                        Query.fromHtml <|
                            Router.View.renderPage { model | loadingCompaniesFile = True }
            ]
