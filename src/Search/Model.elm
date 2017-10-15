module Search.Model exposing (..)

import Companies.Model as CompaniesModel


type alias Model =
    { term : String
    , result : List CompaniesModel.Model
    , label : String
    , userSearching : Bool
    }
