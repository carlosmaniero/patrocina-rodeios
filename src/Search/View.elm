module Search.View exposing (search)

import Search.Model exposing (..)
import Search.Msg as Msg
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


search : Model -> Html Msgs.Msg
search model =
    div [ class "search" ]
        [ h2 [ class "search-label" ]
            [ text model.label ]
        , div
            [ class "search-field" ]
            [ input [ onInput <| Msgs.Search << Msg.Input, value model.term, placeholder "buscar" ] [] ]
        ]
