module Page.CompanyDetail.UpdateSpec exposing (..)

import Page.CompanyDetail.Update
import Page.CompanyDetail.Msgs
import Page.CompanyDetail.Models
import Test exposing (..)
import Expect


tests : Test
tests =
    describe "CompanyDetail Page Update"
        [ test "that given a valid company response the model is updated" <|
            \() ->
                let
                    company =
                        { name = "Cruel Company"
                        , link = "http://cruel-company.com"
                        , twitter = "http://twitter.com/cruel-company"
                        , info = "This company sponsoring rodeos"
                        , image = "http://cruel-company.com/logo.png"
                        , slug = "cruelcompany"
                        }

                    ( updatedModel, cmd ) =
                        Page.CompanyDetail.Update.update
                            (Page.CompanyDetail.Msgs.CompanyDataLoaded <| Ok company)
                            Page.CompanyDetail.Models.init
                in
                    Expect.equal (Just company) updatedModel.company
        ]
