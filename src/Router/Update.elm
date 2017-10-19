module Router.Update exposing (..)

import Router.Msg exposing (Msg(UrlChange, NewPage))
import Router.Model exposing (Model, Page(Home, NotFound), locationToPage)
import Router.Middleware
import Msgs
import Navigation


redirect : Router.Model.Page -> Cmd Msgs.Msg
redirect page =
    Navigation.newUrl (Router.Model.pageToUrl page)


update : Msg -> Model -> ( Model, Cmd Msgs.Msg )
update msg model =
    case msg of
        UrlChange location ->
            let
                page =
                    locationToPage location
            in
                ( { model | page = page }, Router.Middleware.onEnterCmd page )

        NewPage page ->
            ( model, redirect page )
