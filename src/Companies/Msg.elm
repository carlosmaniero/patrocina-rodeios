module Companies.Msg exposing (Msg(..))

import Companies.Model exposing (..)
import Http


type Msg
    = CompaniesLoaded (Result Http.Error (List Model))
