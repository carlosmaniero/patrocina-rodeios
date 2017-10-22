module Companies.DecoderSpec exposing (..)

import Companies.Decoder as Decoder
import Test exposing (..)
import Json.Decode
import Expect


tests : Test
tests =
    describe "Companies Decoder"
        [ test "that decoder transform a json representation in a model object" <|
            \() ->
                let
                    input =
                        """
                          { "name" : "Fucking company",
                            "link" : "http://fucking-company.com",
                            "image" : "http://fucking-company.com/logo.png",
                            "twitter": "http://twitter.com/fucking-company",
                            "info": "This company sponsoring rodeos",
                            "slug": "fuckingcompany" }
                        """

                    decodedOutput =
                        Json.Decode.decodeString
                            Decoder.decodeModel
                            input
                in
                    Expect.equal decodedOutput
                        (Ok
                            { name = "Fucking company"
                            , link = "http://fucking-company.com"
                            , image = "http://fucking-company.com/logo.png"
                            , twitter = "http://twitter.com/fucking-company"
                            , info = "This company sponsoring rodeos"
                            , slug = "fuckingcompany"
                            }
                        )
        , test "that decoder transform a json list representation in a model list" <|
            \() ->
                let
                    input =
                        """
                          [{ "name" : "Fucking company",
                            "link" : "http://fucking-company.com",
                            "image" : "http://fucking-company.com/logo.png",
                            "twitter": "http://twitter.com/fucking-company",
                            "info": "This company sponsoring rodeos",
                            "slug": "fuckingcompany" }]
                        """

                    decodedOutput =
                        Json.Decode.decodeString
                            Decoder.decodeList
                            input
                in
                    Expect.equal decodedOutput
                        (Ok
                            [ { name = "Fucking company"
                              , link = "http://fucking-company.com"
                              , image = "http://fucking-company.com/logo.png"
                              , twitter = "http://twitter.com/fucking-company"
                              , info = "This company sponsoring rodeos"
                              , slug = "fuckingcompany"
                              }
                            ]
                        )
        ]
