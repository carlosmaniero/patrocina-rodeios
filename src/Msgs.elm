module Msgs exposing (Msg(..))

import Search.Msg
import Companies.Msg
import Router.Msg
import Page.CompanyDetail.Msgs
import Page.Home.Msgs
import Navigation


type Msg
    = Router Router.Msg.Msg
    | PageCompanyDetail Page.CompanyDetail.Msgs.Msg
    | PageHome Page.Home.Msgs.Msg
