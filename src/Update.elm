module Update exposing (update)

import Msgs exposing (..)
import Model
import Search.Update as SearchUpdate
import Companies.Update as CompaniesUpdate
import Router.Update


-- UPDATE


update : Msg -> Model.Model -> ( Model.Model, Cmd Msg )
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
