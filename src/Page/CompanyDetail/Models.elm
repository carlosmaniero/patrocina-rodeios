module Page.CompanyDetail.Models exposing (Model, init)

import Layout.Header.Models
import Companies.Models


type alias Model =
    { header : Layout.Header.Models.Model
    , company : Maybe Companies.Models.Model
    }


init : Model
init =
    { company = Nothing
    , header = Layout.Header.Models.init
    }
