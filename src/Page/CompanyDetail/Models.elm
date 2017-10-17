module Page.CompanyDetail.Models exposing (Model, init)

import Layout.Header.Model
import Companies.Model


type alias Model =
    { header : Layout.Header.Model.Model
    , company : Maybe Companies.Model.Model
    }


init : Model
init =
    { company = Nothing
    , header = Layout.Header.Model.init
    }
