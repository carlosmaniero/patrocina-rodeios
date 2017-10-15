module Router.ModelSpec exposing (..)

import Router.Msg as Msg
import Router.Model exposing (..)
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
                    locationToPage { blankLocation | pathname = "/" }
                        |> Expect.equal Home
            , test "that given a location with an invalid path the model page is updated to NotFound" <|
                \() ->
                    locationToPage { blankLocation | pathname = "/this-is-a-route-that-doent-exists" }
                        |> Expect.equal NotFound
            ]
