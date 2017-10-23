module Router.Link exposing (..)

import Model exposing (Model)
import Router.Models
import Router.Msg
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode


onPreventDefaultClick : msg -> Attribute msg
onPreventDefaultClick message =
    onWithOptions "click"
        { defaultOptions | preventDefault = True }
        (preventDefault2
            |> Json.Decode.andThen (maybePreventDefault message)
        )


preventDefault2 : Json.Decode.Decoder Bool
preventDefault2 =
    Json.Decode.map2
        (invertedOr)
        (Json.Decode.field "ctrlKey" Json.Decode.bool)
        (Json.Decode.field "metaKey" Json.Decode.bool)


maybePreventDefault : msg -> Bool -> Json.Decode.Decoder msg
maybePreventDefault msg preventDefault =
    case preventDefault of
        True ->
            Json.Decode.succeed msg

        False ->
            Json.Decode.fail "Normal link"


invertedOr : Bool -> Bool -> Bool
invertedOr x y =
    not (x || y)


renderLink : Router.Models.Page -> List (Attribute Msgs.Msg) -> List (Html Msgs.Msg) -> Html Msgs.Msg
renderLink page attributes childs =
    a
        (attributes
            ++ [ href <| Router.Models.pageToUrl page
               , onPreventDefaultClick (Msgs.Router <| Router.Msg.NewPage page)
               ]
        )
        childs
