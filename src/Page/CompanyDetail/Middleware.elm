module Page.CompanyDetail.Middleware exposing (onEnterCmd)

import Companies.Service
import Page.CompanyDetail.Msgs
import Msgs


onEnterCmd : String -> Cmd Msgs.Msg
onEnterCmd companySlug =
    Companies.Service.getCompany companySlug <|
        Msgs.PageCompanyDetail
            << Page.CompanyDetail.Msgs.CompanyDataLoaded
