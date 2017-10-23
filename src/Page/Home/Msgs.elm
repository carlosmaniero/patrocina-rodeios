module Page.Home.Msgs exposing (Msg(..))

import Companies.Models
import Search.Msg
import Http


type Msg
    = CompaniesDataLoaded (Result Http.Error (List Companies.Models.Model))
    | Search Search.Msg.Msg
