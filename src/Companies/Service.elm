module Companies.Service exposing (..)

import Companies.Model exposing (Model)
import Companies.Msg exposing (Msg(CompaniesLoaded))
import Companies.Decoder exposing (decodeList)
import Msgs
import Http


getCompaniesEndpoint : Http.Request (List Model)
getCompaniesEndpoint =
    Http.get "/data/companies.json" decodeList


getCompanies : Cmd Msgs.Msg
getCompanies =
    Http.send (Msgs.Companies << CompaniesLoaded) getCompaniesEndpoint
