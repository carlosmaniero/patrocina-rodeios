module Update exposing (update)

import Msgs exposing (..)
import Model
import Search.Update
import Companies.Update
import Router.Update
import Page.CompanyDetail.Update
import Page.Home.Update


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
        Search msg ->
            let
                ( searchModel, cmd ) =
                    Search.Update.update msg model.search model.companies
            in
                ( { model | search = searchModel }, cmd )

        Router msg ->
            childUpdate msg model.router Router.Update.update <|
                \childModel -> { model | router = childModel }

        PageCompanyDetail msg ->
            childUpdate msg model.pageCompanyDetail Page.CompanyDetail.Update.update <|
                \childModel -> { model | pageCompanyDetail = childModel }

        PageHome msg ->
            childUpdate msg model.pageHome Page.Home.Update.update <|
                \childModel -> { model | pageHome = childModel }
