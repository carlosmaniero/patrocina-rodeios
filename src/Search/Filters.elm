module Search.Filters exposing (filterCompaniesByName)

import Companies.Model


companyContainsTerm : String -> Companies.Model.Model -> Bool
companyContainsTerm term company =
    String.contains (String.toLower term) (String.toLower company.name)


filterCompaniesByName : String -> List Companies.Model.Model -> List Companies.Model.Model
filterCompaniesByName term companies =
    if String.isEmpty term then
        []
    else
        List.filter (companyContainsTerm term) companies
