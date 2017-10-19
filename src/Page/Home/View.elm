module Page.Home.View exposing (..)

import Page.Home.Models
import Page.Home.Msgs
import Search.View exposing (search)
import Search.Msg
import Layout.Header.View exposing (mainHeader)
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)


render : Page.Home.Models.Model -> Html Msgs.Msg
render model =
    div [ id "page-home" ]
        [ mainHeader model.header
        , search
            (Msgs.PageHome
                << Page.Home.Msgs.Search
                << Search.Msg.Input
            )
            (Msgs.PageHome
                << Page.Home.Msgs.Search
                << Search.Msg.Focus
            )
            (Msgs.PageHome
                << Page.Home.Msgs.Search
                << Search.Msg.KeyDown
            )
            model.search
        ]
