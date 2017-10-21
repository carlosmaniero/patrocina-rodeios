module Msgs exposing (Msg(..))

import Search.Msg
import Companies.Msg
import Router.Msg
import Page.Home.Msgs
import Page.CompanyDetail.Msgs
import Page.CompanyList.Msgs
import Navigation


type Msg
    = Router Router.Msg.Msg
    | PageHome Page.Home.Msgs.Msg
    | PageCompanyDetail Page.CompanyDetail.Msgs.Msg
    | PageCompanyList Page.CompanyList.Msgs.Msg
