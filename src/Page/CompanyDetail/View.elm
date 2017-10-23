module Page.CompanyDetail.View exposing (render)

import Page.CompanyDetail.Models
import Companies.View as CompaniesView exposing (renderCompany)
import Companies.Models exposing (findBySlug)
import Layout.Header.View exposing (mainHeader)
import Msgs
import Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Router.Link


render : String -> Page.CompanyDetail.Models.Model -> Html Msgs.Msg
render companySlug model =
    let
        body =
            case model.company of
                Just company ->
                    [ mainHeader model.header
                    , div [ class "page-company-body page-body" ]
                        [ renderCompany company ]
                    ]

                Nothing ->
                    [ text "Carregando..." ]
    in
        div [ id "page-company" ] body
