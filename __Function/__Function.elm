module Function exposing (Model, Msg, model, update, view, Id, getId)


import Html exposing (..)
--import Html. as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MODEL
type alias Id = Int

type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  , id : Id
  }


model : Int -> Model
model int =
  Model "" "" "" int


{-
init : name-> password -> passwordAgain -> Model
init name password passwordAgain =
  { name = name
  , password = password
  , passwordAgain = passwordAgain
  }
  -}



getId: Model -> Int
getId model = model.id


-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String
    --| Add


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }

    --Add ->
      --model



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "password", placeholder "Password", onInput Password ] []
    , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    --, button [ Html.Events.onClick Add] [text "+"]
    , viewValidation model
    ]


viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if model.password == model.passwordAgain then
        ("green", "OK")
      else
        ("red", "Passwords do not match!")
  in
    div [ style [("color", color)] ] [ text message ]
