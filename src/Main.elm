module Main exposing (..)

import Html exposing (..)
import Msgs exposing (..)
import Model exposing (..)
import Update exposing (..)
import Companies.Service as CompaniesService
import Router.View
import Router.Msg
import Router.Models
import Search.Filters
import Navigation


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    update (Msgs.Router <| Router.Msg.UrlChange location) model



-- VIEW


view : Model -> Html Msg
view model =
    Router.View.renderPage model



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    Navigation.program
        (Msgs.Router
            << Router.Msg.UrlChange
        )
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
