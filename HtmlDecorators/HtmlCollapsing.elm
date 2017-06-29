module HtmlCollapsing exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



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


view : Model -> Html Msg
view model =
  div []
    [
      button [ onClick Close, contentStyle model ] [ text "-" ]
    , button [ onClick Open , plusStyle    model ] [ text "+" ]
    --, button [ onClick Toggle ] [ text "toggle" ]

    ,  div [ contentStyle model ] [ text "example text" ]
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






