module Search.Update exposing (Msg(..), update)
import Search.Model exposing (Model)


type Msg =
    Input String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input term ->
            { model | term = term }
