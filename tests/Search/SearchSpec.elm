module Search.SearchSpec exposing (..)
import Search.View exposing (search)
import Html.Attributes as Attributes
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector

tests : Test
tests =
    describe "Search"
        [ test "that search renders an text input with the given term" <|
            \() ->
            Query.has [ Selector.attribute <| Attributes.value "Cruel Company" ] <|
            Query.find [ Selector.tag "input" ] <|
            Query.fromHtml <|
                search <|
                    { term = "Cruel Company" }
        ]
