module Layout.Header.View exposing (mainHeader)

import Layout.Header.Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


mainHeader : Model -> Html msg
mainHeader model =
    header []
        [ h1 [] [ text model.title ]
        , h2 [] [ text model.subtitle ]
        ]
