module Search.Models exposing (..)

import Companies.Models


type alias Model =
    { term : String
    , result : List Companies.Models.Model
    , selectedCompany : Maybe Companies.Models.Model
    , selectedIndex : Int
    , label : String
    , userSearching : Bool
    }


init : Model
init =
    { term = ""
    , label = "Digite o nome da empresa e veja se há envolvimento com rodeios"
    , result = []
    , selectedCompany = Nothing
    , selectedIndex = -1
    , userSearching = False
    }
