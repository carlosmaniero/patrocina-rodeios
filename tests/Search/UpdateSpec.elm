module Search.UpdateSpec exposing (..)
import Search.Update as Update
import Test exposing (..)
import Expect

tests : Test
tests =
    describe "Search Update"
        [ test "that given a search input the terms are updated" <|
            \() ->
                let
                    updatedModel =
                        Update.update (Update.Input "Just another beer company") <|
                        { term = "Cruel beer company" }
                in
                    Expect.equal updatedModel.term "Just another beer company"
        ]
