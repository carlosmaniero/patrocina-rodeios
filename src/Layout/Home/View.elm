module Layout.Home.View exposing (..)

import Companies.View as CompaniesView exposing (renderCompanies)
import Search.View exposing (search)
import Layout.Header.View exposing (mainHeader)
import Msgs
import Model exposing (..)
import Html exposing (..)


render : Model -> Html Msgs.Msg
render model =
    div []
        [ mainHeader model.header
        , search model.search
        ]
