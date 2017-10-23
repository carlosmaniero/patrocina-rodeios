module Page.CompanyDetail.Update exposing (update)

import Page.CompanyDetail.Models
import Page.CompanyDetail.Msgs
import Router.Models
import Router.Update
import Msgs


update : Page.CompanyDetail.Msgs.Msg -> Page.CompanyDetail.Models.Model -> ( Page.CompanyDetail.Models.Model, Cmd Msgs.Msg )
update msg model =
    case msg of
        Page.CompanyDetail.Msgs.CompanyDataLoaded (Ok company) ->
            ( { model | company = Just company }, Cmd.none )

        Page.CompanyDetail.Msgs.CompanyDataLoaded (Err _) ->
            ( model, Router.Update.redirect Router.Models.NotFound )
