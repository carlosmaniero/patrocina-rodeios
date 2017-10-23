module Model exposing (Model, model)

import Router.Models
import Page.Home.Models
import Page.CompanyDetail.Models
import Page.CompanyList.Models
import Page.NotFound.Models


type alias Model =
    { router : Router.Models.Model
    , pageHome : Page.Home.Models.Model
    , pageCompanyDetail : Page.CompanyDetail.Models.Model
    , pageCompanyList : Page.CompanyList.Models.Model
    , pageNotFound : Page.NotFound.Models.Model
    }


model : Model
model =
    { router = Router.Models.init
    , pageHome = Page.Home.Models.init
    , pageCompanyDetail = Page.CompanyDetail.Models.init
    , pageCompanyList = Page.CompanyList.Models.init
    , pageNotFound = Page.NotFound.Models.init
    }
