module Data.Model exposing (..)

import RemoteData exposing (WebData)
import Data.User exposing (User)


-- krisajenkins/remotedata is an awesome library for modeling remote data requests


type alias Model =
    { users : WebData (List User) -- Wrap your data with WebData!
    }
