module Router.Model exposing (..)

import Navigation


homeUrl =
    "/"


notFoundUrl =
    "not-found"


type Page
    = Home
    | NotFound


type alias Model =
    { page : Page }


locationToPage : Navigation.Location -> Page
locationToPage location =
    if location.pathname == homeUrl then
        Home
    else
        NotFound


pageToUrl : Page -> String
pageToUrl page =
    case page of
        Home ->
            homeUrl

        NotFound ->
            notFoundUrl
