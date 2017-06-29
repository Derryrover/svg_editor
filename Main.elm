import RoseTree
import RoseTreeItem
import RoseTreeBuilder exposing(result)
import RoseTreeHTML
import Html exposing (..)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


type alias Model =
  { item : RoseTreeItem.Model
  , roseTree : RoseTreeHTML.Model--RoseTree.RoseTree RoseTreeItem.Model
  }


init : (Model, Cmd Msg)
init =
  ({ item =  RoseTreeItem.init 1
   , roseTree = (RoseTreeHTML.init result) }, Cmd.none)


type Msg
  = MsgItem RoseTreeItem.Msg
  | HTMLMessage RoseTreeHTML.Msg


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    MsgItem msgItem ->
      let (item, msg) = RoseTreeItem.update msgItem model.item
      in ({model | item = item} , Cmd.map MsgItem msg)--Cmd.
    HTMLMessage msg ->
      let (roseTree, cmd) = RoseTreeHTML.update msg model.roseTree
      in ({model | roseTree = roseTree}, Cmd.map HTMLMessage cmd)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

view : Model -> Html Msg
view model =
  div []
    [ --Html.map MsgItem (RoseTreeItem.view model.item)
     ul [] [Html.map HTMLMessage (RoseTreeHTML.view model.roseTree)]
    ]
