module Main exposing (..)

import Html exposing (..)
import Msgs exposing (..)
import Model exposing (..)
import Layout.Home.View
import Search.Update as SearchUpdate
import Companies.Update as CompaniesUpdate
import Companies.Service as CompaniesService
import Router.Msg
import Router.Model
import Router.Update
import Search.Filters
import Navigation


-- MODEL


model : Model
model =
    { header =
        { title = "Patrocina Rodeios" }
    , search =
        { term = ""
        , label = "Digite o nome da empresa e veja se há envolvimento com redeios"
        , result = []
        , userSearching = False
        }
    , companies =
        []
    , router =
        { page = Router.Model.Home
        }
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        routerModel =
            { page = Router.Model.locationToPage location }
    in
        ( { model | router = routerModel }, CompaniesService.getCompanies )



-- VIEW


view : Model -> Html Msg
view model =
    Layout.Home.View.render model



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Search msg ->
            let
                ( searchModel, cmd ) =
                    SearchUpdate.update msg model.search model.companies
            in
                ( { model | search = searchModel }, cmd )

        Companies msg ->
            let
                ( companiesModel, cmd ) =
                    CompaniesUpdate.update msg model.companies
            in
                ( { model | companies = companiesModel }, cmd )

        Router msg ->
            ( model, Cmd.none )



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
