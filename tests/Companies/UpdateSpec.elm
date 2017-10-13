module Companies.UpdateSpec exposing (..)

import Companies.Update as Update
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
                          , image = "http://cruel-company.com/logo.png"
                          }
                        ]
                in
                    Update.update (Update.CompaniesLoaded <| Ok companyList) []
                        |> Expect.equalLists companyList
        , test "that given an error request the model is not updated" <|
            \() ->
                let
                    companyList =
                        [ { name = "Cruel Company"
                          , link = "http://cruel-company.com"
                          , twitter = "http://twitter.com/cruel-company"
                          , image = "http://cruel-company.com/logo.png"
                          }
                        ]
                in
                    Update.update (Update.CompaniesLoaded <| Err Http.NetworkError) companyList
                        |> Expect.equalLists companyList
        ]
