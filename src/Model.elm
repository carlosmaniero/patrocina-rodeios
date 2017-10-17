module Model exposing (Model, model)

import Layout.Header.Model
import Search.Model
import Router.Model
import Companies.Model
import Page.CompanyDetail.Models
import Page.Home.Models
import Search.Init
import Router.Init


type alias Model =
    { header : Layout.Header.Model.Model
    , search : Search.Model.Model
    , companies : List Companies.Model.Model
    , router : Router.Model.Model
    , pageHome : Page.Home.Models.Model
    , pageCompanyDetail : Page.CompanyDetail.Models.Model
    }


model : Model
model =
    { header = Layout.Header.Model.init
    , search = Search.Init.init
    , companies =
        []
    , router = Router.Init.init
    , pageHome = Page.Home.Models.init
    , pageCompanyDetail = Page.CompanyDetail.Models.init
    }
