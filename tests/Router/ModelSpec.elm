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
        describe "Router Model"
            [ test "that given a location with an empty path the model page is updated to home" <|
                \() ->
                    locationToPage { blankLocation | pathname = "/" }
                        |> Expect.equal Home
            , test "that given a company detail location the model page is updated to home" <|
                \() ->
                    locationToPage { blankLocation | pathname = "/company/cruelcompany/" }
                        |> Expect.equal (CompanyDetail "cruelcompany")
            , test "that given a location with an invalid path the model page is updated to NotFound" <|
                \() ->
                    locationToPage { blankLocation | pathname = "/this-is-a-route-that-doent-exists" }
                        |> Expect.equal NotFound
            , test "that given a page I can get the page url" <|
                \() ->
                    pageToUrl Home
                        |> Expect.equal "/"
            , test "that given a company detail page I can get the page url" <|
                \() ->
                    pageToUrl (CompanyDetail "cruelcompany")
                        |> Expect.equal "/company/cruelcompany/"
            ]
