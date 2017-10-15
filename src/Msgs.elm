module Msgs exposing (Msg(..))

import Search.Msg as SearchMsg
import Companies.Msg as CompaniesMsg
import Router.Msg as RouterMsg
import Navigation


type Msg
    = Search SearchMsg.Msg
    | Companies CompaniesMsg.Msg
    | Router RouterMsg.Msg
