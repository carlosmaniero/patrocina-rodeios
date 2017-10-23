module Page.CompanyDetail.Msgs exposing (Msg(..))

import Companies.Models
import Http


type Msg
    = CompanyDataLoaded (Result Http.Error Companies.Models.Model)
