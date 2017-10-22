module Search.UpdateSpec exposing (..)

import Search.Update as Update
import Search.Init exposing (init)
import Search.Msg as Msg
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
        describe "Search Update"
            [ test "that given a search input the terms are updated" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.Input "Just another beer company")
                                { init | term = "Cruel beer company", userSearching = True }
                                validCompanies
                    in
                        Expect.equal updatedModel.term "Just another beer company"
            , test "that given a search input the result is a list of filtered companies" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.Input firstCompany.name)
                                { init | userSearching = True }
                                validCompanies
                    in
                        Expect.equalLists updatedModel.result [ firstCompany ]
            , test "that when input focus the user searching flag is set true" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.Focus True)
                                { init | userSearching = False }
                                validCompanies
                    in
                        Expect.true "the userSearching should be true" updatedModel.userSearching
            , test "that when input blur the user searching flag is set false" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.Focus False)
                                { init | userSearching = True }
                                validCompanies
                    in
                        Expect.false "the userSearching should be false" updatedModel.userSearching
            , test "that when the arrow down is pressed the first company in the result list is selected" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.KeyDown 40)
                                { init | result = validCompanies, userSearching = True }
                                validCompanies
                    in
                        Expect.equal updatedModel.selectedCompany <| Just firstCompany
            , test "that when arrow down is pressed more times than the result list length the selected company stills the last one" <|
                \() ->
                    let
                        ( updatedModel1, cmd1 ) =
                            Update.update
                                (Msg.KeyDown 40)
                                { init | result = validCompanies, userSearching = True }
                                validCompanies

                        ( updatedModel2, cmd2 ) =
                            Update.update
                                (Msg.KeyDown 40)
                                updatedModel1
                                validCompanies

                        ( updatedModel3, cmd3 ) =
                            Update.update
                                (Msg.KeyDown 40)
                                updatedModel2
                                validCompanies

                        ( updatedModel4, cmd4 ) =
                            Update.update
                                (Msg.KeyDown 40)
                                updatedModel3
                                validCompanies
                    in
                        Expect.equal updatedModel4.selectedCompany <| Just thirdCompany
            , test "that when the arrow up is pressed the previous selected company is selecte" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.KeyDown 38)
                                { init | result = validCompanies, userSearching = True, selectedIndex = 2 }
                                validCompanies
                    in
                        Expect.equal updatedModel.selectedCompany <| Just secondCompany
            , test "that when the arrow up is pressed and I've no company selected it stills in the -1 index" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.KeyDown 38)
                                { init | result = validCompanies, userSearching = True, selectedIndex = -1 }
                                validCompanies
                    in
                        Expect.equal updatedModel.selectedIndex -1
            ]
