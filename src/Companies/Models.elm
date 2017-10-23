module Companies.Models exposing (..)


type alias Model =
    { name : String
    , link : String
    , image : String
    , twitter : String
    , info : String
    , slug : String
    }


findBySlug : String -> List Model -> Maybe Model
findBySlug slug companies =
    case List.head companies of
        Just company ->
            if company.slug == slug then
                Just company
            else
                findBySlug slug <| List.drop 1 companies

        Nothing ->
            Nothing
