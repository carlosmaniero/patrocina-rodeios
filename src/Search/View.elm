module Search.View exposing (search)

import Search.Model exposing (..)
import Search.Msg as Msg
import Companies.Model
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Router.Link
import Router.Model
import Json.Decode as Json


onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown tagger =
    on "keydown" (Json.map tagger keyCode)


renderValue : Model -> String
renderValue model =
    case model.selectedCompany of
        Just company ->
            company.name

        Nothing ->
            model.term


search : (String -> Msgs.Msg) -> (Bool -> Msgs.Msg) -> (Int -> Msgs.Msg) -> Model -> Html Msgs.Msg
search onInputMsg onFocusMsg onKeyDownMsg model =
    div [ class "search" ]
        [ h2 [ class "search-label" ]
            [ text model.label ]
        , div
            [ class "search-field" ]
            [ input
                [ onInput onInputMsg
                , onFocus <| onFocusMsg True
                , onBlur <| onFocusMsg False
                , onKeyDown <| onKeyDownMsg
                , value <| renderValue model
                , placeholder "buscar"
                ]
                []
            ]
        , quickView model
        ]


quickViewItem : Maybe Companies.Model.Model -> Companies.Model.Model -> Html Msgs.Msg
quickViewItem selected company =
    let
        selectedClass =
            case selected of
                Just selectedCompany ->
                    if company == selectedCompany then
                        "active"
                    else
                        ""

                Nothing ->
                    ""
    in
        li [ class selectedClass ]
            [ Router.Link.renderLink (Router.Model.CompanyDetail company.slug) [] [ text company.name ] ]


quickView : Model -> Html Msgs.Msg
quickView model =
    let
        visibilityClass =
            if List.isEmpty model.result || not model.userSearching then
                "hidden"
            else
                ""
    in
        div [ class <| "search-quick-view " ++ visibilityClass ]
            [ ul [ class "search-quick-view-list" ] <| List.map (quickViewItem model.selectedCompany) model.result ]
