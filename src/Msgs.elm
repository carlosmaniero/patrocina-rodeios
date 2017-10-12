module Msgs exposing (Msg(..))
import Search.Update as SearchUpdate


type Msg
    = Search SearchUpdate.Msg
