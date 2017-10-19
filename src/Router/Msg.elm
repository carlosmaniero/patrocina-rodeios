module Router.Msg exposing (Msg(..))

import Router.Model
import Navigation


type Msg
    = UrlChange Navigation.Location
    | NewPage Router.Model.Page
