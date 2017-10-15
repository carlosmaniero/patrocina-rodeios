module Msgs exposing (Msg(..))

import Search.Msg as SearchMsg
import Companies.Msg as CompaniesMsg


type Msg
    = Search SearchMsg.Msg
    | Companies CompaniesMsg.Msg
