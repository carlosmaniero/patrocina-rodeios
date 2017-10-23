module Layout.Header.View exposing (mainHeader)

import Layout.Header.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Router.Link
import Router.Models
import Msgs


mainHeader : Model -> Html Msgs.Msg
mainHeader model =
    header [ class "main-header" ]
        [ h1 []
            [ Router.Link.renderLink Router.Models.Home [] [ text model.title ] ]
        , nav []
            [ ul []
                [ li [] [ Router.Link.renderLink Router.Models.CompanyList [ class "btn" ] [ text "Lista de empresas" ] ] ]
            ]
        ]
