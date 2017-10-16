module Router.View exposing (..)

import Model exposing (Model)
import Router.Model
import Layout.Home.View
import Layout.NotFound.View
import Layout.Company.View
import Layout.Loading.View
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)


renderPage : Model -> Html Msgs.Msg
renderPage model =
    if model.loadingCompaniesFile then
        Layout.Loading.View.render model
    else
        case model.router.page of
            Router.Model.Home ->
                Layout.Home.View.render model

            Router.Model.NotFound ->
                Layout.NotFound.View.render model

            Router.Model.CompanyDetail companySlug ->
                Layout.Company.View.render companySlug model
