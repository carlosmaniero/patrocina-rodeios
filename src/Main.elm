module Main exposing (..)

import Html exposing (..)
import Msgs exposing (..)
import Layout.Header.Model as HeaderModel
import Layout.Header.View exposing (mainHeader)
import Search.Model as SearchModel
import Search.Update as SearchUpdate
import Companies.Update as CompaniesUpdate
import Companies.Model as CompaniesModel
import Companies.Service as CompaniesService
import Companies.View as CompaniesView exposing (renderCompanies)
import Search.View exposing (search)
import Search.Filters


-- MODEL


type alias Model =
    { header : HeaderModel.Model
    , search : SearchModel.Model
    , companies : List CompaniesModel.Model
    }


model : Model
model =
    { header =
        { title = "Patrocina Rodeios"
        , subtitle = "Descubra quais são as empresas que patrocinam rodeios."
        }
    , search =
        { term = ""
        , result = []
        }
    , companies =
        []
    }


init : ( Model, Cmd Msg )
init =
    ( model, CompaniesService.getCompanies )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ mainHeader model.header
        , search model.search
        , renderCompanies model.search.result
        ]



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



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
