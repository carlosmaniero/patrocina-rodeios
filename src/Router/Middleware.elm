module Router.Middleware exposing (onEnterCmd)

import Router.Models
import Page.CompanyDetail.Middleware
import Page.CompanyList.Middleware
import Page.Home.Middleware
import Msgs


onEnterCmd : Router.Models.Page -> Cmd Msgs.Msg
onEnterCmd page =
    case page of
        Router.Models.Home ->
            Page.Home.Middleware.onEnterCmd

        Router.Models.CompanyDetail page ->
            Page.CompanyDetail.Middleware.onEnterCmd page

        Router.Models.NotFound ->
            Cmd.none

        Router.Models.CompanyList ->
            Page.CompanyList.Middleware.onEnterCmd
