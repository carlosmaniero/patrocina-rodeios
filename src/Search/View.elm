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


search : (String -> Msgs.Msg) -> (Bool -> Msgs.Msg) -> Model -> Html Msgs.Msg
search onInputMsg onFocusMsg model =
    div [ class "search" ]
        [ h2 [ class "search-label" ]
            [ text model.label ]
        , div
            [ class "search-field" ]
            [ input
                [ onInput onInputMsg
                , onFocus <| onFocusMsg True
                , onBlur <| onFocusMsg False
                , value model.term
                , placeholder "buscar"
                ]
                []
            ]
        , quickView model
        ]


quickViewItem : Companies.Model.Model -> Html Msgs.Msg
quickViewItem company =
    li []
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
            [ ul [ class "search-quick-view-list" ] <| List.map quickViewItem model.result ]
