module Router.Update exposing (..)

import Router.Msg exposing (Msg(UrlChange, NewPage))
import Router.Models exposing (Model, Page(Home, NotFound), locationToPage)
import Router.Middleware
import Msgs
import Navigation


redirect : Router.Models.Page -> Cmd Msgs.Msg
redirect page =
    Navigation.newUrl (Router.Models.pageToUrl page)


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
