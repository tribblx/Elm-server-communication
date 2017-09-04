module Main exposing (..)

import Msgs exposing (..)
import Data.Model exposing (Model)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import RemoteData exposing (WebData)
import Request.Users exposing (getUsers)
import Components.User exposing (usersView)


-- APP


main : Program Never Model Msg
main =
    Html.program
        { init = ( model, Cmd.none )
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }



-- MODEL


model : Model
model =
    { users = RemoteData.NotAsked }



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GetUsers ->
            ( model, getUsers )

        OnGetUsers usersdata ->
            ( { model | users = usersdata }, Cmd.none )



-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib


view : Model -> Html Msg
view model =
    div [ class "container", style [ ( "margin-top", "30px" ), ( "text-align", "center" ) ] ]
        [ -- inline CSS (literal)
          img [ src "http://www.thinkgeek.com/images/products/additional/large/1bd2_archer_danger_zone.jpg", onClick GetUsers ] []
        , button [ class "btn btn-primary btn-lg", onClick GetUsers ]
            [ -- click handler
              span [ class "glyphicon glyphicon-star" ] [] -- glyphicon
            , span [] [ text "FTW!" ]
            ]
        , usersView model
        ]


styles : { img : List ( String, String ) }
styles =
    { img =
        [ ( "width", "33%" )
        , ( "border", "4px solid #337AB7" )
        ]
    }
