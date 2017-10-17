module Search.Init exposing (init)

import Search.Model


init : Search.Model.Model
init =
    { term = ""
    , label = "Digite o nome da empresa e veja se há envolvimento com rodeios"
    , result = []
    , userSearching = False
    }
