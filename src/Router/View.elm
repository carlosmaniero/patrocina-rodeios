module Router.View exposing (..)

import Model exposing (Model)
import Router.Model
import Page.Home.View
import Page.CompanyDetail.View
import Page.CompanyList.View
import Page.NotFound.View
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)


renderPage : Model -> Html Msgs.Msg
renderPage model =
    case model.router.page of
        Router.Model.Home ->
            Page.Home.View.render model.pageHome

        Router.Model.NotFound ->
            Page.NotFound.View.render model.pageNotFound

        Router.Model.CompanyDetail companySlug ->
            Page.CompanyDetail.View.render companySlug model.pageCompanyDetail

        Router.Model.CompanyList ->
            Page.CompanyList.View.render model.pageCompanyList
