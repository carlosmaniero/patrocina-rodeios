module Router.Middleware exposing (onEnterCmd)

import Router.Model
import Page.CompanyDetail.Middleware
import Page.Home.Middleware
import Msgs


onEnterCmd : Router.Model.Page -> Cmd Msgs.Msg
onEnterCmd page =
    case page of
        Router.Model.Home ->
            Page.Home.Middleware.onEnterCmd

        Router.Model.CompanyDetail page ->
            Page.CompanyDetail.Middleware.onEnterCmd page

        Router.Model.NotFound ->
            Cmd.none
