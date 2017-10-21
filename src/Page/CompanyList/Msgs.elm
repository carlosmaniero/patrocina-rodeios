module Page.CompanyList.Msgs exposing (..)

import Companies.Model
import Http


type Msg
    = CompaniesDataLoaded (Result Http.Error (List Companies.Model.Model))
