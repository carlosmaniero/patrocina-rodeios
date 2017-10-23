module Page.CompanyList.View exposing (..)

import Page.CompanyList.Models
import Page.CompanyList.Msgs
import Layout.Header.View exposing (mainHeader)
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)
import Companies.Models
import Router.Link
import Router.Models


companyListItem : Companies.Models.Model -> Html Msgs.Msg
companyListItem company =
    li
        [ class "company-list-item" ]
        [ Router.Link.renderLink (Router.Models.CompanyDetail company.slug)
            []
            [ img [ src company.image ] []
            , text company.name
            ]
        ]


render : Page.CompanyList.Models.Model -> Html Msgs.Msg
render model =
    div [ id "page-company-list" ]
        [ mainHeader model.header
        , div [ id "page-company-body", class "page-body" ]
            [ header []
                [ h2 [] [ text "Empresas envolvidas com rodeios" ]
                , p [] [ text "Confira abaixo a lista de empresas que financiam a dor e sofrimento dos animais nos rodeios." ]
                ]
            , ul
                [ class "company-list" ]
                (List.map
                    companyListItem
                    model.companies
                )
            , footer []
                [ h3 [] [ text "Sugerir empresa" ]
                , p [] [ text "Quer sugerir uma empresa que não está na lista? Clique no botão abaixo." ]
                , a [ href "https://docs.google.com/forms/d/14VGatuc-35Fc0EP_eO53XAhJyc9vSabfEKishTEUduo", class "btn" ] [ text "Sugerir empresa" ]
                ]
            ]
        ]
