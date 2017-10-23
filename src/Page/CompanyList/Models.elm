module Page.CompanyList.Models exposing (Model, init)

import Companies.Models
import Layout.Header.Models


type alias Model =
    { companies : List Companies.Models.Model
    , header : Layout.Header.Models.Model
    }


init : Model
init =
    { companies = []
    , header = Layout.Header.Models.init
    }
