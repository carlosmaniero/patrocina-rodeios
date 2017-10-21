module Page.CompanyList.Update exposing (update)

import Page.CompanyList.Msgs
import Page.CompanyList.Models
import Search.Update
import Msgs


update : Page.CompanyList.Msgs.Msg -> Page.CompanyList.Models.Model -> ( Page.CompanyList.Models.Model, Cmd Msgs.Msg )
update msg model =
    case msg of
        Page.CompanyList.Msgs.CompaniesDataLoaded (Ok companies) ->
            ( { model | companies = companies }, Cmd.none )

        Page.CompanyList.Msgs.CompaniesDataLoaded (Err _) ->
            ( model, Cmd.none )
