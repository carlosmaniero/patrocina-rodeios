module Page.Home.UpdateSpec exposing (..)

import Page.Home.Msgs
import Page.Home.Update
import Page.Home.Models
import Search.Msg
import Test exposing (..)
import Expect


tests : Test
tests =
    describe "Home Page Update"
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
                        Page.Home.Update.update
                            (Page.Home.Msgs.CompaniesDataLoaded <| Ok companyList)
                            Page.Home.Models.init
                in
                    Expect.equal companyList updatedModel.companies
        , test "that given a search input the search term is updated" <|
            \() ->
                let
                    ( updatedModel, cmd ) =
                        Page.Home.Update.update
                            (Page.Home.Msgs.Search <| Search.Msg.Input "my-term")
                            Page.Home.Models.init
                in
                    Expect.equal "my-term" updatedModel.search.term
        , test "that given a search focus the search focus is updated" <|
            \() ->
                let
                    ( updatedModel, cmd ) =
                        Page.Home.Update.update
                            (Page.Home.Msgs.Search <| Search.Msg.Focus True)
                            Page.Home.Models.init
                in
                    Expect.equal True updatedModel.search.userSearching
        , test "that given a no search focus the search focus is updated" <|
            \() ->
                let
                    ( updatedModel, cmd ) =
                        Page.Home.Update.update
                            (Page.Home.Msgs.Search <| Search.Msg.Focus False)
                            Page.Home.Models.init
                in
                    Expect.equal False updatedModel.search.userSearching
        ]
