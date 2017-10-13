module Msgs exposing (Msg(..))

import Search.Update as SearchUpdate
import Companies.Update as CompaniesUpdate


type Msg
    = Search SearchUpdate.Msg
    | Companies CompaniesUpdate.Msg
