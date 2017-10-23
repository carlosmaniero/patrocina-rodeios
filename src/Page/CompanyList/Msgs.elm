module Page.CompanyList.Msgs exposing (..)

import Companies.Models
import Http


type Msg
    = CompaniesDataLoaded (Result Http.Error (List Companies.Models.Model))
