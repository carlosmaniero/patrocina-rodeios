module Search.Update exposing (update)

import Search.Model exposing (Model)
import Search.Msg exposing (..)
import Search.Filters exposing (filterCompaniesByName)
import Companies.Model
import Router.Update
import Router.Model
import Msgs
import Array


type MoveQuickView
    = MoveQuickViewDown
    | MoveQuickViewUp


updateSelected : MoveQuickView -> Model -> Model
updateSelected moveTo model =
    let
        selectedIndex =
            (case moveTo of
                MoveQuickViewUp ->
                    model.selectedIndex - 1

                MoveQuickViewDown ->
                    model.selectedIndex + 1
            )
                |> min ((List.length model.result) - 1)
                |> max -1

        resultArray =
            Array.fromList model.result
    in
        { model | selectedCompany = Array.get selectedIndex resultArray, selectedIndex = selectedIndex }


resetSelected : Model -> Model
resetSelected model =
    { model | selectedCompany = Nothing, selectedIndex = -1 }


update : Msg -> Model -> List Companies.Model.Model -> ( Model, Cmd Msgs.Msg )
update msg model companies =
    let
        resetedModel =
            resetSelected model
    in
        case msg of
            Input term ->
                ( { resetedModel | term = term, result = filterCompaniesByName term companies }, Cmd.none )

            Focus isFocus ->
                ( { resetedModel | userSearching = isFocus }, Cmd.none )

            KeyDown key ->
                if key == 40 then
                    ( updateSelected MoveQuickViewDown model, Cmd.none )
                else if key == 38 then
                    ( updateSelected MoveQuickViewUp model, Cmd.none )
                else if key == 13 then
                    ( model
                    , case model.selectedCompany of
                        Just company ->
                            Router.Update.redirect <| Router.Model.CompanyDetail company.slug

                        Nothing ->
                            Cmd.none
                    )
                else
                    ( resetedModel, Cmd.none )
