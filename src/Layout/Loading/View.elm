module Layout.Loading.View exposing (..)

import Layout.Header.View exposing (mainHeader)
import Msgs
import Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


render : Model -> Html Msgs.Msg
render model =
    div [ id "page-loading" ]
        [ mainHeader model.header
        , div [ class "loading-body" ]
            [ h2 []
                [ text "Carregando..." ]
            ]
        ]
