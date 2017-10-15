module Search.Update exposing (update)

import Search.Model exposing (Model)
import Search.Msg exposing (..)
import Search.Filters exposing (filterCompaniesByName)
import Companies.Model
import Msgs


update : Msg -> Model -> List Companies.Model.Model -> ( Model, Cmd Msgs.Msg )
update msg model companies =
    case msg of
        Input term ->
            ( { model | term = term, result = filterCompaniesByName term companies }, Cmd.none )

        Focus isFocus ->
            ( { model | userSearching = isFocus }, Cmd.none )
