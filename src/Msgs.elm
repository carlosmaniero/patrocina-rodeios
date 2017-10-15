module Msgs exposing (Msg(..))

import Search.Msg as SearchMsg
import Companies.Msg as CompaniesMsg
import Navigation


type Msg
    = Search SearchMsg.Msg
    | Companies CompaniesMsg.Msg
    | UrlChange Navigation.Location
