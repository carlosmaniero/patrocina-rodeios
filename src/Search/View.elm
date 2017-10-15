module Search.View exposing (search)

import Search.Model exposing (..)
import Search.Msg as Msg
import Companies.Model
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


search : Model -> Html Msgs.Msg
search model =
    div [ class "search" ]
        [ h2 [ class "search-label" ]
            [ text model.label ]
        , div
            [ class "search-field" ]
            [ input
                [ onInput <| Msgs.Search << Msg.Input
                , onFocus <| Msgs.Search <| Msg.Focus True
                , onBlur <| Msgs.Search <| Msg.Focus False
                , value model.term
                , placeholder "buscar"
                ]
                []
            ]
        , quickView model
        ]


quickViewItem : Companies.Model.Model -> Html Msgs.Msg
quickViewItem company =
    li [] [ text company.name ]


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
