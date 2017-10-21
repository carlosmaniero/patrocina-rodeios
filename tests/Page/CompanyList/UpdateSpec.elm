module Page.CompanyList.UpdateSpec exposing (..)

import Page.CompanyList.Msgs
import Page.CompanyList.Models
import Page.CompanyList.Update
import Test exposing (..)
import Expect


tests : Test
tests =
    describe "Company List Page Update"
        [ test "that given a valid company list response the model is updated" <|
            \() ->
                let
                    companyList =
                        [ { name = "Cruel Company"
                          , link = "http://cruel-company.com"
                          , twitter = "http://twitter.com/cruel-company"
                          , image = "http://cruel-company.com/logo.png"
                          , slug = "cruelcompany"
                          }
                        ]

                    ( updatedModel, cmd ) =
                        Page.CompanyList.Update.update
                            (Page.CompanyList.Msgs.CompaniesDataLoaded <| Ok companyList)
                            Page.CompanyList.Models.init
                in
                    Expect.equal companyList updatedModel.companies
        ]
