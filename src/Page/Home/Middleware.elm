module Page.Home.Middleware exposing (onEnterCmd)

import Page.Home.Msgs
import Companies.Service
import Msgs


onEnterCmd : Cmd Msgs.Msg
onEnterCmd =
    Companies.Service.getCompanies <|
        Msgs.PageHome
            << Page.Home.Msgs.CompaniesDataLoaded
