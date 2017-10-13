module Companies.Update exposing (..)

import Companies.Model exposing (Model)
import Http


type Msg
    = CompaniesLoaded (Result Http.Error (List Model))


update : Msg -> List Model -> List Model
update msg model =
    case msg of
        CompaniesLoaded (Ok companies) ->
            companies

        CompaniesLoaded (Err _) ->
            model
