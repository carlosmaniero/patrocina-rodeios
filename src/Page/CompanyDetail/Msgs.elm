module Page.CompanyDetail.Msgs exposing (Msg(..))

import Companies.Model
import Http


type Msg
    = CompanyDataLoaded (Result Http.Error Companies.Model.Model)
