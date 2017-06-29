--module HtmlCollapsingDecorator exposing (Model, Msg, init, update, view)
module HtmlCollapsingDecorator exposing (a)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html.App as App


{--
type Msg x
  = Open
  | Close
  | Input x
  --}


htmlGate: Html x -> Html x
htmlGate html = div [] [html]

--htmlGate: Html x -> Html (Msg x)
--htmlGate html = div [onClick Open] [App.map (Input) html]




{-
type alias InputModel a = a
type alias InputMsg a = a
type alias InputInit a = a
type alias InputUpdate a = a
type alias InputView a = a


type alias Input a b c d e =
  {
  model: InputModel a,
  msg: InputMsg b,
  init: InputInit c,
  update: InputUpdate d,
  view: InputView e
  }


--injector : input -> Output


-- MODEL

type State = Opened | Closed

type alias Model = State


--init : State -> Model
init =
  Opened



-- UPDATE


type Msg
  = Open
  | Close
  | Toggle
  | InputMsg


update : Msg -> Model -> Model
update msg model =
  case msg of
    Open ->
      Opened

    Close ->
      Closed

    Toggle ->
      if model == Opened
      then Closed
      else Opened



-- VIEW


--view : (inputModel -> Html inputMsg) -> (Model -> Html Msg)
view : Html Msg -> Model -> Html Msg
--view : Model -> Html Msg
view html model =
  div []
    [
      button [ onClick Close, contentStyle model ] [ text "-" ]
    , button [ onClick Open , plusStyle    model ] [ text "+" ]
    --, button [ onClick Toggle ] [ text "toggle" ]

    ,  div [ contentStyle model ] [ text "example text", html ]
    ]

contentStyle : Model -> Attribute msg
contentStyle model =
  case model of
    Opened -> style [("display", "inline-block")]
    Closed -> style [("display", "none")]

plusStyle : Model -> Attribute msg
plusStyle model =
  case model of
    Opened -> style [("display", "none")]
    Closed -> style [("display", "inline-block")]

-}




