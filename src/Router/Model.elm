module Router.Model exposing (..)

import Navigation
import Regex
import UrlParser exposing ((</>))


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


route : UrlParser.Parser (Page -> a) a
route =
    UrlParser.oneOf
        [ UrlParser.map Home (UrlParser.s "")
        , UrlParser.map CompanyDetail (UrlParser.s "company" </> UrlParser.string)
        ]


locationToPage : Navigation.Location -> Page
locationToPage location =
    case UrlParser.parsePath route location of
        Just page ->
            page

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
