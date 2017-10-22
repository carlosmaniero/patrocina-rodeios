module Page.CompanyDetail.ViewSpec exposing (..)

import Page.CompanyDetail.View
import Page.CompanyDetail.Models
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Test exposing (..)


tests : Test
tests =
    let
        blankModel =
            Page.CompanyDetail.Models.init

        company =
            { name = "Cruel Company"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            , info = "This company sponsoring rodeos"
            , slug = "cruelcompany"
            }
    in
        describe "Page Company Detail View"
            [ test "that a loading message is displayed while the company is not loaded" <|
                \() ->
                    Query.has [ Selector.text "Carregando..." ] <|
                        Query.fromHtml <|
                            Page.CompanyDetail.View.render "companyslug" blankModel
            , test "that the company is rendered" <|
                \() ->
                    Query.has [ Selector.text company.name ] <|
                        Query.find [ Selector.tag "h2" ] <|
                            Query.find [ Selector.class "company-item" ] <|
                                Query.fromHtml <|
                                    Page.CompanyDetail.View.render "companyslug" { blankModel | company = Just company }
            ]
