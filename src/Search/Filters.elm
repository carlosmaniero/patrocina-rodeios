module Search.Filters exposing (filterCompaniesByName)

import Companies.Models


companyContainsTerm : String -> Companies.Models.Model -> Bool
companyContainsTerm term company =
    String.startsWith (String.toLower term) (String.toLower company.name)


filterCompaniesByName : String -> List Companies.Models.Model -> List Companies.Models.Model
filterCompaniesByName term companies =
    if String.isEmpty term then
        []
    else
        List.filter (companyContainsTerm term) companies
