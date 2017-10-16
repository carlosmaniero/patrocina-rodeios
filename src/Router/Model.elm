module Router.Model exposing (..)

import Navigation
import Regex


homeUrl =
    "/"


notFoundUrl =
    "not-found"


companyUrlPattern =
    Regex.regex "/company/(\\w+)/?$"


type Page
    = Home
    | CompanyDetail String
    | NotFound


type alias Model =
    { page : Page }


locationToPage : Navigation.Location -> Page
locationToPage location =
    if location.pathname == homeUrl then
        Home
    else
        let
            match =
                Regex.find (Regex.AtMost 1) companyUrlPattern location.pathname
        in
            case List.head match of
                Just companyMatch ->
                    case List.head companyMatch.submatches of
                        Just companySlug ->
                            Maybe.withDefault "" companySlug
                                |> CompanyDetail

                        Nothing ->
                            NotFound

                Nothing ->
                    NotFound


pageToUrl : Page -> String
pageToUrl page =
    case page of
        Home ->
            homeUrl

        NotFound ->
            notFoundUrl

        CompanyDetail companySlug ->
            "/company/" ++ companySlug ++ "/"
