module Router.LinkSpec exposing (..)

import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Test exposing (..)
import Html
import Html.Attributes as Attributes
import Router.Link exposing (renderLink)
import Router.Models exposing (..)


tests : Test
tests =
    describe "Router Link"
        [ test "that given an attribute list it is inserted in the link" <|
            \() ->
                Query.has [ Selector.class "my-favorite-link" ] <|
                    Query.fromHtml <|
                        renderLink Home [ Attributes.class "my-favorite-link " ] []
        , test "that given a link body it is inserted in the link" <|
            \() ->
                Query.has [ Selector.text "my-favorite-link" ] <|
                    Query.fromHtml <|
                        renderLink Home [] [ Html.text "my-favorite-link " ]
        , test "that given the page Home it returns the home Url" <|
            \() ->
                Query.has [ Selector.attribute <| Attributes.href "/" ] <|
                    Query.fromHtml <|
                        renderLink Home [] []
        ]
