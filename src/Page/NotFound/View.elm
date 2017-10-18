module Page.NotFound.View exposing (..)

import Page.NotFound.Models
import Layout.Header.View exposing (mainHeader)
import Msgs
import Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Router.Link
import Router.Model


render : Page.NotFound.Models.Model -> Html Msgs.Msg
render model =
    div [ id "page-not-found" ]
        [ mainHeader model.header
        , div [ class "not-found-body" ]
            [ h2 []
                [ text "Ops! Página Não encontrada" ]
            , Router.Link.renderLink
                Router.Model.Home
                [ class "btn" ]
                [ text "Voltar para a home" ]
            ]
        ]
