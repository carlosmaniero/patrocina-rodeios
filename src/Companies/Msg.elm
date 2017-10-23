module Companies.Msg exposing (Msg(..))

import Companies.Models exposing (..)
import Http


type Msg
    = CompaniesLoaded (Result Http.Error (List Model))
