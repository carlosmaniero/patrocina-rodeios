module Companies.Decoder exposing (..)

import Companies.Models exposing (Model)
import Json.Decode exposing (..)
import Json.Decode.Pipeline


decodeModel : Decoder Model
decodeModel =
    Json.Decode.Pipeline.decode Model
        |> Json.Decode.Pipeline.required "name" Json.Decode.string
        |> Json.Decode.Pipeline.required "link" Json.Decode.string
        |> Json.Decode.Pipeline.required "image" Json.Decode.string
        |> Json.Decode.Pipeline.required "twitter" Json.Decode.string
        |> Json.Decode.Pipeline.required "info" Json.Decode.string
        |> Json.Decode.Pipeline.required "slug" Json.Decode.string


decodeList =
    Json.Decode.list decodeModel
