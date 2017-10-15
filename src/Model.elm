module Model exposing (Model)

import Layout.Header.Model as HeaderModel
import Search.Model as SearchModel
import Companies.Model as CompaniesModel


type alias Model =
    { header : HeaderModel.Model
    , search : SearchModel.Model
    , companies : List CompaniesModel.Model
    , currentUrl : String
    }
