module Search.FilterSpec exposing (..)

import Search.Filters as Filter
import Test exposing (..)
import Expect


tests : Test
tests =
    let
        firstCompany =
            { name = "Cruel Company"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            , info = "This company sponsoring rodeos"
            , slug = "cruelcompany"
            }

        secondCompany =
            { name = "BBQ Food"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            , info = "This company sponsoring rodeos"
            , slug = "cruelcompany2"
            }

        thirdCompany =
            { name = "Cruel Music Band"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            , info = "This company sponsoring rodeos"
            , slug = "cruelcompany3"
            }

        validCompanies =
            [ firstCompany
            , secondCompany
            , thirdCompany
            ]
    in
        describe "Search Filter"
            [ test "that given a list of companies and a search term it returns the company with the exact name" <|
                \() ->
                    Expect.equalLists [ firstCompany ] <|
                        Filter.filterCompaniesByName "Cruel Company" validCompanies
            , test "that given a list of companies and a search term it returns the company with the partial name" <|
                \() ->
                    Expect.equalLists [ firstCompany, thirdCompany ] <|
                        Filter.filterCompaniesByName "Cruel" validCompanies
            , test "that given a list of companies and a search term that doesn't match with any company name it returns an empty list" <|
                \() ->
                    Expect.true "should be a empty list" <|
                        List.isEmpty <|
                            Filter.filterCompaniesByName "LALALALALALA" validCompanies
            , test "that given a list of companies and a blank search it returns an empty list" <|
                \() ->
                    Expect.true "should be a empty list" <|
                        List.isEmpty <|
                            Filter.filterCompaniesByName "" validCompanies
            ]
