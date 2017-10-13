module Search.View exposing (search)

import Search.Model exposing (..)
import Search.Update as Update
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


search : Model -> Html Msgs.Msg
search model =
    div []
        [ input [ onInput <| Msgs.Search << Update.Input, value model.term ] [] ]
