module Request.Users exposing (..)

--import Msgs as Msg exposing (..)

import HttpBuilder exposing (get, withExpect, toRequest)
import Json.Decode as Decode
import Data.User exposing (User, Address, Coordinates)
import Request.Helpers exposing (apiUrl)
import Http exposing (expectJson)
import Json.Decode.Pipeline exposing (decode, required, optional)
import Msgs
import RemoteData


getUsers : Cmd Msgs.Msg
getUsers =
    getUsersRequest
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnGetUsers


getUsersRequest : Http.Request (List User)
getUsersRequest =
    get (apiUrl "/users")
        |> withExpect (Http.expectJson <| Decode.list userDecoder)
        |> toRequest



-- Decoders for a User


userDecoder : Decode.Decoder User
userDecoder =
    decode User
        |> required "id" Decode.int
        |> required "name" Decode.string
        |> required "username" Decode.string
        |> optional "email" Decode.string "noname@gmail.com"
        |> required "address" addressDecoder


addressDecoder : Decode.Decoder Address
addressDecoder =
    decode Address
        |> required "street" Decode.string
        |> required "suite" Decode.string
        |> required "city" Decode.string
        |> required "zipcode" Decode.string
        |> required "geo" coordinatesDecoder


coordinatesDecoder : Decode.Decoder Coordinates
coordinatesDecoder =
    decode Coordinates
        |> required "lat" Decode.string
        |> required "lng" Decode.string
