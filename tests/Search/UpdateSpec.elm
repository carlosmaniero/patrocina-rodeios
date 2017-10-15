module Search.UpdateSpec exposing (..)

import Search.Update as Update
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
            }

        secondCompany =
            { name = "BBQ Food"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
            }

        thirdCompany =
            { name = "cruel Music Band"
            , link = "http://cruel-company.com"
            , image = "http://cruel-company.com/logo.png"
            , twitter = "http://twitter.com/cruel-company"
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
                                { term = "Cruel beer company", result = [], label = "", userSearching = True }
                                validCompanies
                    in
                        Expect.equal updatedModel.term "Just another beer company"
            , test "that given a search input the result is a list of filtered companies" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.Input firstCompany.name)
                                { term = "", result = [], label = "", userSearching = True }
                                validCompanies
                    in
                        Expect.equalLists updatedModel.result [ firstCompany ]
            , test "that when input focus the user searching flag is set true" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.Focus True)
                                { term = "", result = [], label = "", userSearching = False }
                                validCompanies
                    in
                        Expect.true "the userSearching should be true" updatedModel.userSearching
            , test "that when input blur the user searching flag is set false" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.Focus False)
                                { term = "", result = [], label = "", userSearching = True }
                                validCompanies
                    in
                        Expect.false "the userSearching should be false" updatedModel.userSearching
            ]
