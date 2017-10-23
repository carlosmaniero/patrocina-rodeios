module Companies.View exposing (..)

import Companies.Models exposing (Model)
import Msgs exposing (Msg)
import Html exposing (..)
import Html.Attributes exposing (..)


renderCompany : Model -> Html Msg
renderCompany company =
    div [ class "company-item" ]
        [ header []
            [ img [ src company.image ] []
            , h2 [] [ text company.name ]
            ]
        , div [ class "company-alert" ]
            [ text <| "Infelizmente a " ++ company.name ++ " patrocina rodeios." ]
        , div [ class "company-item-body" ]
            [ p [ class "company-info" ]
                [ text company.info ]
            , a
                [ href company.link
                , target "_blank"
                , class "company-reference btn"
                ]
                [ text "Fonte" ]
            , a
                [ href <| "https://twitter.com/" ++ company.twitter
                , target "_blank"
                , class "company-twitter btn"
                ]
                [ text "Twitter da Empresa" ]
            ]
        ]


renderCompanies : List Model -> Html Msg
renderCompanies companyList =
    div [] <|
        List.map renderCompany companyList
