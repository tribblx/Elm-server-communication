module Request.Helpers exposing (..)


apiUrl : String -> String
apiUrl str =
    "https://jsonplaceholder.typicode.com" ++ str
