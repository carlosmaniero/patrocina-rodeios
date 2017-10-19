module Page.Home.Update exposing (update)

import Page.Home.Msgs
import Page.Home.Models
import Search.Update
import Msgs


update : Page.Home.Msgs.Msg -> Page.Home.Models.Model -> ( Page.Home.Models.Model, Cmd Msgs.Msg )
update msg model =
    case msg of
        Page.Home.Msgs.CompaniesDataLoaded (Ok companies) ->
            ( { model | companies = companies }, Cmd.none )

        Page.Home.Msgs.CompaniesDataLoaded (Err _) ->
            ( model, Cmd.none )

        Page.Home.Msgs.Search msg ->
            let
                ( searchModel, cmd ) =
                    Search.Update.update msg model.search model.companies
            in
                ( { model | search = searchModel }, cmd )
