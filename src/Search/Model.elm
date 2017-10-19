module Search.Model exposing (..)

import Companies.Model as CompaniesModel


type alias Model =
    { term : String
    , result : List CompaniesModel.Model
    , selectedCompany : Maybe CompaniesModel.Model
    , selectedIndex : Int
    , label : String
    , userSearching : Bool
    }
