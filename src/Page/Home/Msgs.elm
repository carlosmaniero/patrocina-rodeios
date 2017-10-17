module Page.Home.Msgs exposing (Msg(..))

import Companies.Model
import Search.Msg
import Http


type Msg
    = CompaniesDataLoaded (Result Http.Error (List Companies.Model.Model))
    | Search Search.Msg.Msg
