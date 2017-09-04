module Components.User exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Data.Model exposing (Model)
import RemoteData exposing (WebData)


-- user component


usersView : Model -> Html a
usersView model =
    case model.users of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Failure err ->
            text ("Houston we have a problem" ++ toString err)

        RemoteData.Success users ->
            div [] (usersList users)


usersList : List { a | name : String } -> List (Html msg)
usersList users =
    List.map (\user -> userView user) users


userView : { a | name : String } -> Html msg
userView user =
    div
        [ class "h1" ]
        [ text user.name ]
