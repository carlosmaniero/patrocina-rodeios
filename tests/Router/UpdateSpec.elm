module Router.UpdateSpec exposing (..)

import Router.Update as Update
import Router.Msg as Msg
import Router.Models exposing (..)
import Test exposing (..)
import Expect


tests : Test
tests =
    let
        blankLocation =
            { href = ""
            , host = ""
            , hostname = ""
            , protocol = ""
            , origin = ""
            , port_ = ""
            , pathname = ""
            , search = ""
            , hash = ""
            , username = ""
            , password = ""
            }
    in
        describe "Router Update"
            [ test "that given a location with an empty path the model page is updated to home" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.UrlChange { blankLocation | pathname = "/" })
                                { page = NotFound }
                    in
                        Expect.equal updatedModel.page Home
            , test "that given a location with an invalid path the model page is updated to NotFound" <|
                \() ->
                    let
                        ( updatedModel, cmd ) =
                            Update.update
                                (Msg.UrlChange { blankLocation | pathname = "/this-is-a-route-that-doent-exists" })
                                { page = Home }
                    in
                        Expect.equal updatedModel.page NotFound
            ]
