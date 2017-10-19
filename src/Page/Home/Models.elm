module Page.Home.Models exposing (Model, init)

import Layout.Header.Model
import Search.Model
import Search.Init
import Companies.Model


type alias Model =
    { header : Layout.Header.Model.Model
    , search : Search.Model.Model
    , companies : List Companies.Model.Model
    }


init =
    { header = Layout.Header.Model.init
    , search = Search.Init.init
    , companies =
        []
    }
