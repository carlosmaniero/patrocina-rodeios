module Companies.ModelSpec exposing (..)

import Companies.Model
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
        describe "Companies Model"
            [ test "that find by slug returns the company given a valid correct company slug" <|
                \() ->
                    Expect.equal (Just firstCompany) <|
                        Companies.Model.findBySlug "cruelcompany" validCompanies
            , test "that find by slug returns nothing given an incorrect company slug" <|
                \() ->
                    Expect.equal Nothing <|
                        Companies.Model.findBySlug "goodcompany" validCompanies
            ]
