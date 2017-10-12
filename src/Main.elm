module Main exposing (..)
import Html exposing (..)
import Msgs exposing (..)
import Common.Header.Model as HeaderModel
import Common.Header.View exposing (mainHeader)
import Search.Model as SearchModel
import Search.Update as SearchUpdate
import Search.View exposing (search)


-- MODEL

type alias Model =
    { header : HeaderModel.Model
    , search : SearchModel.Model }


model : Model
model =
    { header =
        { title = "Patrocina Rodeios"
        , subtitle = "Descubra quais são as empresas que patrocinam rodeios." }
    , search =
        { term = "Olá, Mundo!" }
    }

init : ( Model, Cmd Msg )
init =
    ( model , Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
    [ mainHeader model.header
    , search model.search
    ]


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Search msg ->
            ( { model | search = SearchUpdate.update msg model.search }, Cmd.none )




-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

