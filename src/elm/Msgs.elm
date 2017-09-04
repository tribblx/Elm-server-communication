module Msgs exposing (..)

import RemoteData exposing (WebData)
import Data.User exposing (User)


type Msg
    = NoOp
    | GetUsers
    | OnGetUsers (WebData (List User))
