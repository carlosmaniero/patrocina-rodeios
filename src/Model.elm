module Model exposing (Model, model)

import Layout.Header.Model
import Search.Model
import Router.Model
import Companies.Model
import Page.Home.Models
import Page.CompanyDetail.Models
import Page.CompanyList.Models
import Page.NotFound.Models
import Search.Init
import Router.Init


type alias Model =
    { router : Router.Model.Model
    , pageHome : Page.Home.Models.Model
    , pageCompanyDetail : Page.CompanyDetail.Models.Model
    , pageCompanyList : Page.CompanyList.Models.Model
    , pageNotFound : Page.NotFound.Models.Model
    }


model : Model
model =
    { router = Router.Init.init
    , pageHome = Page.Home.Models.init
    , pageCompanyDetail = Page.CompanyDetail.Models.init
    , pageCompanyList = Page.CompanyList.Models.init
    , pageNotFound = Page.NotFound.Models.init
    }
