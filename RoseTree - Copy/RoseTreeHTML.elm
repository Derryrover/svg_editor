module RoseTreeHTML exposing (..) --Msg, update, view, init, extract)

import RoseTree
import RoseTreeItem
import List exposing(map)
import Maybe exposing(..)
import Random
import Html exposing (Html, ul, li, div, text, node, button, select, option)
import Html.Attributes exposing (..)
import Html.Events exposing(onInput)
import PreventDefault exposing(onClickPreventDefault)
import RoseTreeHTMLPorts exposing(..)

type Msg = Direction RoseTreeItem.Model RoseTreeItem.Msg | Add RoseTreeItem.Model | CreatedRandom RoseTreeItem.Model RoseTreeItem.Id | New RoseTreeItem.Model String

type alias Model = { tree: RoseTree.RoseTree RoseTreeItem.Model
                   , idHideSelect: Maybe RoseTreeItem.Model}

init tree = {tree=tree, idHideSelect = Nothing}



view : Model -> Html Msg
view {tree, idHideSelect} = ((li [class "tree_node"]
  [ div [class "svg_circle_input_whole_item"] [(Html.map (Direction (RoseTree.root tree))) (RoseTreeItem.view (RoseTree.root tree))]
  --, div [] [(text (toString idHideSelect))]
  , selectBuilder tree --doNeedSelect tree idHideSelect
  -- , (ul [] (List.concat [ (doNeedSelect tree idHideSelect)
  --                       , (List.map view ( List.map (\tree-> {tree=tree,idHideSelect=idHideSelect}) (RoseTree.children tree) ))]
  -- ))
  , ul [] (List.map view ( List.map (\tree-> {tree=tree,idHideSelect=idHideSelect}) (RoseTree.children tree) ))
  ]))


doNeedSelect tree idHideSelect =
   li [] [(selectBuilder tree)]
{-
  case idHideSelect of
    Nothing ->
      [ li [] [(selectBuilder tree)]]
    Just itemHideSelect ->
      if (RoseTreeItem.compare (RoseTree.root tree) itemHideSelect) then
        []
      else
        [ li [] [(selectBuilder tree)]]-}

selectItems = [ "circle", "rect", "ellipse", "line", "polyline", "polygon", "path"]

selectBuilder tree = 
  select 
  [ class "svg_input_general div_new_tree_child_select"
  , onInput (New (RoseTree.root tree))
  , id ( toString((RoseTree.root tree).id)) ] 
  (List.concat 
    [[option [(value "select new item"), selected True, disabled True, hidden True] [text "select new item"]],
                                                                               (List.map (\item-> option [(value item)] [text item]) selectItems) ])



updateHelperRose : RoseTreeItem.Model -> RoseTreeItem.Msg -> RoseTreeItem.Model -> ( RoseTreeItem.Model, Cmd RoseTreeItem.Msg)
updateHelperRose msgValue msg valueToTest =
  if RoseTreeItem.compare msgValue valueToTest then
    RoseTreeItem.update msg valueToTest
  else
    (valueToTest, Cmd.none)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
 case msg of
   Direction item itemMsg ->
    let
      updatedRose = RoseTree.map (\n-> let (rose, cmd) = (updateHelperRose item itemMsg n) in rose) model.tree
      roseTreeCmds = RoseTree.map (\n-> let (rose, cmd) = (updateHelperRose item itemMsg n) in cmd) model.tree
      cmdList = RoseTree.flatten roseTreeCmds
    in ({model | tree = updatedRose}, Cmd.map (Direction item) (Cmd.batch cmdList))
   CreatedRandom item id ->
     let
       tester = (\tree-> RoseTreeItem.compare item (RoseTree.root tree))
       func = RoseTree.addChild (RoseTree.singleton (RoseTreeItem.init id))
       curry = RoseTree.findAndUpdate tester func
      in
     ({tree = curry model.tree, idHideSelect = Nothing}, setSelectToDefault (toString item.id))--Cmd.none)
   Add item ->
     (model, Random.generate (CreatedRandom item) (Random.int 1 1000000))
   New item str ->
     ({model | idHideSelect = Just item}, Random.generate (CreatedRandom item) (Random.int 1 1000000))
