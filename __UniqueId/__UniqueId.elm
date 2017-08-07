module UniqueId exposing (Model, Msg, init, update, view, increase, createUniqueId)

import Html exposing (Html, button, div, text)
--import Html.App as Html
import Html.Events exposing (onClick)

import Char
import Random

lowercaseLetter : Random.Generator Char
lowercaseLetter =
  Random.map (\n -> Char.fromCode (n + 97)) (Random.int 0 25)


createUniqueId: Random.Generator String
createUniqueId =
  Random.map (\n -> toString(Char.fromCode (n + 97))) (Random.int 0 25)

-- MODEL

type alias Model = Int


init : Model
init =
  1

-- UPDATE


increase model = model + 1

type Msg
  = Increment


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      increase model


-- VIEW


view : Model -> Html Msg
view model =
  div [] [
    div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]


{--
updateWithModel = {
   model = Model
  ,update = update }
--}
