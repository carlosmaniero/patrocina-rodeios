module Page.NotFound.Models exposing (Model, init)

import Layout.Header.Model


type alias Model =
    { header : Layout.Header.Model.Model }


init : Model
init =
    { header = Layout.Header.Model.init }
