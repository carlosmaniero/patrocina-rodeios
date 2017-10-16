module Router.Link exposing (..)

import Model exposing (Model)
import Router.Model
import Msgs
import Html exposing (..)
import Html.Attributes exposing (..)


renderLink : Router.Model.Page -> List (Attribute Msgs.Msg) -> List (Html Msgs.Msg) -> Html Msgs.Msg
renderLink page attributes childs =
    a (attributes ++ [ href <| Router.Model.pageToUrl page ]) childs
