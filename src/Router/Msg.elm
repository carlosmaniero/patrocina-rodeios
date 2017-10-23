module Router.Msg exposing (Msg(..))

import Router.Models
import Navigation


type Msg
    = UrlChange Navigation.Location
    | NewPage Router.Models.Page
