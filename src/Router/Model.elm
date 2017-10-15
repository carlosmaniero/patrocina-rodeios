module Router.Model exposing (..)

import Navigation


type Page
    = Home
    | NotFound


type alias Model =
    { page : Page }


locationToPage : Navigation.Location -> Page
locationToPage location =
    if location.pathname == "/" then
        Home
    else
        NotFound
