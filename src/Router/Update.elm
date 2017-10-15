module Router.Update exposing (..)

import Router.Msg exposing (Msg(UrlChange))
import Router.Model exposing (Model, Page(Home, NotFound), locationToPage)
import Msgs


update : Msg -> Model -> ( Model, Cmd Msgs.Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( { model | page = locationToPage location }, Cmd.none )
