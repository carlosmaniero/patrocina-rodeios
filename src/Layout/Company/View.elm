module Layout.Company.View exposing (..)

import Companies.View as CompaniesView exposing (renderCompany)
import Companies.Model exposing (findBySlug)
import Layout.Header.View exposing (mainHeader)
import Layout.NotFound.View
import Msgs
import Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Router.Link


render : String -> Model -> Html Msgs.Msg
render companySlug model =
    case findBySlug companySlug model.companies of
        Just company ->
            div [ id "page-company" ]
                [ mainHeader model.header
                , div [ class "page-company-body" ]
                    [ renderCompany company ]
                ]

        Nothing ->
            Layout.NotFound.View.render model
