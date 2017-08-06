module SvgCircle exposing (..)

import Dice exposing(..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (style)
import Random
import ParseInt

main =
  Html.program
    { init = init 1
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

--type alias Model = Int
type alias Model =
  { dice: Dice.Model
  , x: Int
  , y: Int }

init :Int -> (Model, Cmd Msg)
init n = ({ dice = n
          , x = 1
          , y = 1 }, Cmd.none)


type Msg
  = Dice Dice.Msg | X String | Y String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Dice d ->
      let (diceModel, diceCommand) = Dice.update d model.dice
      in ({model | dice = diceModel},Cmd.map Dice diceCommand)
    X strX ->
      let res = String.toInt strX--ParseInt.parseInt strX
      in
        case res of
          Result.Err _ ->
            (model, Cmd.none)
          Result.Ok value ->
            ({model | x = value}, Cmd.none)
    Y strY ->
      let res = String.toInt strY--ParseInt.parseInt strY
      in
        case res of
          Result.Err _ ->
            (model, Cmd.none)
          Result.Ok value ->
            ({model | y = value}, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


view : Model -> Html Msg
view model =
  div [ style [("border-style" , "solid")]] [
        label [] [text "X"]
      , input [onInput X] []
      , label [] [text "Y"]
      , input [onInput Y] []
      , div [] [text ("x:" ++ (toString model.x) ++", y:"++(toString model.y))]
      , Html.map Dice (Dice.view model.dice)
      ]


    --style ["height" => "100%", "display"=>"flex", "justify-content"=> "center", "align-items"=>"center"]