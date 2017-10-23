module Layout.Header.ViewSpec exposing (..)

import Layout.Header.View exposing (mainHeader)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Test exposing (..)


tests : Test
tests =
    describe "Header"
        [ test "that header is rendered with the correct title" <|
            \() ->
                Query.has [ Selector.text "Hello, World!" ] <|
                    Query.find [ Selector.tag "h1" ] <|
                        Query.fromHtml <|
                            mainHeader <|
                                { title = "Hello, World!" }
        ]
