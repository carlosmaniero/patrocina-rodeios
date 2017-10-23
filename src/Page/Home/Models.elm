module Page.Home.Models exposing (Model, init)

import Layout.Header.Models
import Search.Models
import Companies.Models


type alias Model =
    { header : Layout.Header.Models.Model
    , search : Search.Models.Model
    , companies : List Companies.Models.Model
    }


init =
    { header = Layout.Header.Models.init
    , search = Search.Models.init
    , companies =
        []
    }
