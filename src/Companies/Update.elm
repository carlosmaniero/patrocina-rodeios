module Companies.Update exposing (..)

import Companies.Models exposing (Model)
import Companies.Msg as Msg
import Msgs
import Http


update : Msg.Msg -> List Model -> ( List Model, Cmd Msgs.Msg )
update msg model =
    case msg of
        Msg.CompaniesLoaded (Ok companies) ->
            ( companies, Cmd.none )

        Msg.CompaniesLoaded (Err _) ->
            ( model, Cmd.none )
