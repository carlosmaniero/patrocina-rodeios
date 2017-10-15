module Search.Update exposing (update)

import Search.Model exposing (Model)
import Search.Msg exposing (..)
import Msgs


update : Msg -> Model -> ( Model, Cmd Msgs.Msg )
update msg model =
    case msg of
        Input term ->
            ( { model | term = term }, Cmd.none )
