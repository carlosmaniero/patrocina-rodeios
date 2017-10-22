module Companies.UpdateSpec exposing (..)

import Companies.Update as Update
import Companies.Msg as Msg
import Test exposing (..)
import Expect
import Http


tests : Test
tests =
    describe "Companies Update"
        [ test "that given a success request the model is updated to the request body" <|
            \() ->
                let
                    companyList =
                        [ { name = "Cruel Company"
                          , link = "http://cruel-company.com"
                          , twitter = "http://twitter.com/cruel-company"
                          , info = "This company sponsoring rodeos"
                          , image = "http://cruel-company.com/logo.png"
                          , slug = "cruelcompany"
                          }
                        ]
                in
                    Update.update (Msg.CompaniesLoaded <| Ok companyList) []
                        |> Tuple.first
                        |> Expect.equalLists companyList
        , test "that given an error request the model is not updated" <|
            \() ->
                let
                    companyList =
                        [ { name = "Cruel Company"
                          , link = "http://cruel-company.com"
                          , twitter = "http://twitter.com/cruel-company"
                          , image = "http://cruel-company.com/logo.png"
                          , info = "This company sponsoring rodeos"
                          , slug = "cruelcompany"
                          }
                        ]
                in
                    Update.update (Msg.CompaniesLoaded <| Err Http.NetworkError) companyList
                        |> Tuple.first
                        |> Expect.equalLists companyList
        ]
