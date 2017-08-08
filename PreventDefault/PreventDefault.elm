module PreventDefault exposing (onClickPreventDefault)

import Html exposing (Html)
import Html.Events exposing (..)
import Json.Decode

onClickPreventDefault : a -> Html.Attribute a
onClickPreventDefault message =
  onWithOptions
  "click"
  { preventDefault = True, stopPropagation = True }
  (Json.Decode.succeed message)
