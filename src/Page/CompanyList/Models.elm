module Page.CompanyList.Models exposing (Model, init)

import Companies.Model
import Layout.Header.Model


type alias Model =
    { companies : List Companies.Model.Model
    , header : Layout.Header.Model.Model
    }


init : Model
init =
    { companies = []
    , header = Layout.Header.Model.init
    }
