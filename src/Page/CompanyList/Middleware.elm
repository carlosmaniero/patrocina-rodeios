module Page.CompanyList.Middleware exposing (..)

import Page.CompanyList.Msgs
import Companies.Service
import Msgs


onEnterCmd : Cmd Msgs.Msg
onEnterCmd =
    Companies.Service.getCompanies <|
        Msgs.PageCompanyList
            << Page.CompanyList.Msgs.CompaniesDataLoaded
