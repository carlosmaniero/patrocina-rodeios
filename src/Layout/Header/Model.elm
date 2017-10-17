module Layout.Header.Model exposing (Model, init)


type alias Model =
    { title : String }


init : Model
init =
    { title = "Patrocina Rodeios" }
