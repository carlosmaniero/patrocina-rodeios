module Router.View exposing (..)

import Model exposing (Model)
import Router.Model
import Page.Home.View
import Layout.NotFound.View
import Layout.Loading.View
import Page.CompanyDetail.View
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)


renderPage : Model -> Html Msgs.Msg
renderPage model =
    case model.router.page of
        Router.Model.Home ->
            Page.Home.View.render model.pageHome

        Router.Model.NotFound ->
            Layout.NotFound.View.render model

        Router.Model.CompanyDetail companySlug ->
            Page.CompanyDetail.View.render companySlug model.pageCompanyDetail
