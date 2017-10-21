module Update exposing (update)

import Msgs exposing (..)
import Model
import Companies.Update
import Router.Update
import Page.Home.Update
import Page.CompanyDetail.Update
import Page.CompanyList.Update
import Model


-- UPDATE


childUpdate : msg -> model -> (msg -> model -> ( model, Cmd Msg )) -> (model -> Model.Model) -> ( Model.Model, Cmd Msg )
childUpdate msg model pageUpdate modelUpdate =
    let
        ( childModel, cmd ) =
            pageUpdate msg model
    in
        ( modelUpdate childModel, cmd )


update : Msg -> Model.Model -> ( Model.Model, Cmd Msg )
update msg model =
    case msg of
        Router msg ->
            let
                cleanModel =
                    Model.model
            in
                childUpdate msg cleanModel.router Router.Update.update <|
                    \childModel -> { cleanModel | router = childModel }

        PageHome msg ->
            childUpdate msg model.pageHome Page.Home.Update.update <|
                \childModel -> { model | pageHome = childModel }

        PageCompanyDetail msg ->
            childUpdate msg model.pageCompanyDetail Page.CompanyDetail.Update.update <|
                \childModel -> { model | pageCompanyDetail = childModel }

        PageCompanyList msg ->
            childUpdate msg model.pageCompanyList Page.CompanyList.Update.update <|
                \childModel -> { model | pageCompanyList = childModel }
