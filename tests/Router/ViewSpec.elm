module Router.ViewSpec exposing (..)

import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Router.Model
import Router.View


tests : Test
tests =
    let
        model =
            { header =
                { title = "Patrocina Rodeios" }
            , search =
                { term = ""
                , label = "Digite o nome da empresa e veja se há envolvimento com redeios"
                , result = []
                , userSearching = False
                }
            , companies =
                []
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
            ]
