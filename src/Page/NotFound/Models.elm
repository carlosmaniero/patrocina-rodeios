module Page.NotFound.Models exposing (Model, init)

import Layout.Header.Models


type alias Model =
    { header : Layout.Header.Models.Model }


init : Model
init =
    { header = Layout.Header.Models.init }
