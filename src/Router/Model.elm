module Router.Model exposing (..)

import Navigation
import Regex
import UrlParser exposing ((</>))


homeUrl =
    "/"


notFoundUrl =
    "/not-found"


companyListUrl =
    "/companies/"


companyDetailUrl =
    "/company/"


type Page
    = Home
    | CompanyDetail String
    | CompanyList
    | NotFound


type alias Model =
    { page : Page }


route : UrlParser.Parser (Page -> a) a
route =
    UrlParser.oneOf
        [ UrlParser.map Home (UrlParser.s "")
        , UrlParser.map CompanyList (UrlParser.s "companies")
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
            companyDetailUrl ++ companySlug ++ "/"

        CompanyList ->
            companyListUrl
