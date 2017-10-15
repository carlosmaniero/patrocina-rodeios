module Search.UpdateSpec exposing (..)

import Search.Update as Update
import Search.Msg as Msg
import Test exposing (..)
import Expect


tests : Test
tests =
    describe "Search Update"
        [ test "that given a search input the terms are updated" <|
            \() ->
                let
                    ( updatedModel, cmd ) =
                        Update.update (Msg.Input "Just another beer company") <|
                            { term = "Cruel beer company", result = [] }
                in
                    Expect.equal updatedModel.term "Just another beer company"
        ]
