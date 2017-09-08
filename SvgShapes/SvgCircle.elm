module SvgCircle exposing (..)

import Dice exposing(..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (value, class)
import Random
import ParseInt

main =
  Html.program
    { init = init 1
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


--Dice is here so that we have a wrling example about how to pass task messages over the tree structure
type alias Model =
  {
    --dice: Dice.Model,
    x: Int
  , y: Int }

init :Int -> (Model, Cmd Msg)
init n = ({ x = 1
          , y = 1
          --, dice = n
          }, Cmd.none)

type Msg
  =
    X String
  | Y String
  --| Dice Dice.Msg

view : Model -> Html Msg
view model =
  div
    [ class "svg_circle_input_whole_item"] --("border-style" , "solid"),
    [ div []
      [ label [] [text "X"]
      , input
        [ onInput X
        , value (toString model.x)
        , class "svg_input_general svg_xy_input"] []]
    , div []
      [ label [] [text "Y"]
      , input
       [ onInput Y
       , value (toString model.y)
       , class "svg_input_general svg_xy_input"] []]
    --, div [] [text ("x:" ++ (toString model.x) ++", y:"++(toString model.y))]
    --, Html.map Dice (Dice.view model.dice)
    ]

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
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
    {-
    Dice d ->
      let (diceModel, diceCommand) = Dice.update d model.dice
      in ({model | dice = diceModel},Cmd.map Dice diceCommand)
      -}


