module Router.ViewSpec exposing (..)

import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Router.Models
import Router.View
import Model


tests : Test
tests =
    let
        model =
            Model.model
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
                            Router.View.renderPage { model | router = { page = Router.Models.NotFound } }
            , test "that company detail page is rendered given a correct company slug" <|
                \() ->
                    Query.has [ Selector.id "page-company" ] <|
                        Query.fromHtml <|
                            Router.View.renderPage { model | router = { page = Router.Models.CompanyDetail "cruelcompany" } }
            ]
