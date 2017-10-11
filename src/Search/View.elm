module Search.View exposing (search)
import Search.Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

search : Model -> Html msg
search model =
    div []
    [ input [ value model.term ] []]
