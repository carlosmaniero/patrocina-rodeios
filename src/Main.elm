module Main exposing (..)

import Html exposing (..)
import Msgs exposing (..)
import Common.Header.Model as HeaderModel
import Common.Header.View exposing (mainHeader)
import Search.Model as SearchModel
import Search.Update as SearchUpdate
import Companies.Update as CompaniesUpdate
import Companies.Model as CompaniesModel
import Companies.Service as CompaniesService
import Companies.View as CompaniesView exposing (renderCompanies)
import Search.View exposing (search)


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
        { term = "Olá, Mundo!" }
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
        , renderCompanies model.companies
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Search msg ->
            ( { model | search = SearchUpdate.update msg model.search }, Cmd.none )

        Companies msg ->
            ( { model | companies = CompaniesUpdate.update msg model.companies }, Cmd.none )



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
