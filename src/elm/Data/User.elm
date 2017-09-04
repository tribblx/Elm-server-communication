module Data.User exposing (..)


type alias User =
    { id : Int
    , name : String
    , username : String
    , email : String
    , address : Address
    }


type alias Address =
    { street : String
    , suite : String
    , city : String
    , zipcode : String
    , geo : Coordinates
    }


type alias Coordinates =
    { lat : String
    , lng : String
    }
