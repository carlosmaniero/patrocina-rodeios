module Companies.Service exposing (..)

import Companies.Model exposing (Model)
import Companies.Msg exposing (Msg(CompaniesLoaded))
import Companies.Decoder exposing (decodeList, decodeModel)
import Msgs
import Http


getCompaniesEndpoint : Http.Request (List Model)
getCompaniesEndpoint =
    Http.get "/data/companies.json" decodeList


getCompanyEndpoint : String -> Http.Request Model
getCompanyEndpoint slug =
    Http.get ("/data/company/" ++ slug ++ ".json") decodeModel


getCompanies : (Result Http.Error (List Model) -> Msgs.Msg) -> Cmd Msgs.Msg
getCompanies msg =
    Http.send msg getCompaniesEndpoint


getCompany : String -> (Result Http.Error Model -> Msgs.Msg) -> Cmd Msgs.Msg
getCompany slug msg =
    Http.send msg <|
        getCompanyEndpoint slug
