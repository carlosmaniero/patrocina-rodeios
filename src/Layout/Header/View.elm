module Layout.Header.View exposing (mainHeader)

import Layout.Header.Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Router.Link
import Router.Model
import Msgs


mainHeader : Model -> Html Msgs.Msg
mainHeader model =
    header [ class "main-header" ]
        [ h1 []
            [ Router.Link.renderLink Router.Model.Home [] [ text model.title ] ]
        ]
