module Model exposing (Model, model)

import Layout.Header.Model
import Search.Model
import Router.Model
import Companies.Model
import Page.CompanyDetail.Models
import Page.Home.Models
import Page.NotFound.Models
import Search.Init
import Router.Init


type alias Model =
    { router : Router.Model.Model
    , pageHome : Page.Home.Models.Model
    , pageCompanyDetail : Page.CompanyDetail.Models.Model
    , pageNotFound : Page.NotFound.Models.Model
    }


model : Model
model =
    { router = Router.Init.init
    , pageHome = Page.Home.Models.init
    , pageCompanyDetail = Page.CompanyDetail.Models.init
    , pageNotFound = Page.NotFound.Models.init
    }
