module Dice exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (style)
import Random

main =
  Html.program
    { init = init 1
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type alias Model = Int

init :Int -> (Model, Cmd Msg)
init n = (n, Cmd.none)


type Msg
  = Roll
  | NewFace Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model, Random.generate NewFace (Random.int 1 6))
    NewFace newFace ->
      (newFace , Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


view : Model -> Html Msg
view model =
  div [style [("border-style" , "solid")]]
    [ button [ onClick Roll ] [ text "ROL" ]
    , div [] [ text (toString model) ]
    ]


    --style ["height" => "100%", "display"=>"flex", "justify-content"=> "center", "align-items"=>"center"]
