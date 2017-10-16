module Router.View exposing (..)

import Model exposing (Model)
import Router.Model
import Layout.Home.View
import Layout.NotFound.View
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)


renderPage : Model -> Html Msgs.Msg
renderPage model =
    case model.router.page of
        Router.Model.Home ->
            Layout.Home.View.render model

        Router.Model.NotFound ->
            Layout.NotFound.View.render model

        Router.Model.CompanyDetail _ ->
            Layout.NotFound.View.render model
