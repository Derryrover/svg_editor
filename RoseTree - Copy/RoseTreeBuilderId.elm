module RoseTreeBuilderId exposing(buildDummieTree, update, view, Model, Msg, init, getTree)

import RoseTree exposing(..)
import Function
import RoseTreeItem
import UniqueId
import Html exposing (Html, button, div, text)
--import Html.App as Html
import Html.Events exposing (onClick)

-- MODEL
type alias Model = {
  idGeneratorState: UniqueId.Model,
  tree: RoseTree.RoseTree RoseTreeItem.Model
}


getTree: Model -> RoseTree.RoseTree RoseTreeItem.Model
getTree model = model.tree



init : Model
init = {
 idGeneratorState = UniqueId.init,
 tree = RoseTree.singleton (RoseTreeItem.model 0)}

-- VIEW

{-
view : Model -> Html x
view model =
  div [] [
    text (toString model.idGeneratorState)
    ]
-}

view : Model -> Html Msg
view model = div [] [
    div [] [ text (toString model) ]
    , button [ onClick Increase ] [ text "+" ]
    ]

--MSG

type Msg
  = Increase

-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increase ->
      ({idGeneratorState = UniqueId.increase model.idGeneratorState, tree = RoseTree.addChild (RoseTree.singleton (RoseTreeItem.model model.idGeneratorState)) model.tree} , Cmd.none)

--buildDummieTree: UniqueId.model -> RoseTree.RoseTree Function.Model
buildDummieTree =
  let
    tree1  = RoseTree.singleton (Function.model 1)
    tree11 = RoseTree.singleton (Function.model 17)
    tree12 = RoseTree.singleton (Function.model 12)
    tree13 = RoseTree.singleton (Function.model 13)
    tree14 = RoseTree.singleton (Function.model 14)
    tree15 = RoseTree.singleton (Function.model 15)
    tree151 = RoseTree.singleton (Function.model 151)
    tree15Complete = RoseTree.addChild tree151 tree15
  in
    RoseTree.addChildren [tree11, tree12, tree13, tree14, tree15Complete] tree1

--createNewItem: Model -> RoseTree.RoseTree Function.Model
--createNewItem model = RoseTree.singleton (Function.model model)

{-
tree1 = RoseTree.singleton 1

tree11 = RoseTree.singleton 11
tree12 = RoseTree.singleton 12
tree13 = RoseTree.singleton 13
tree14 = RoseTree.singleton 14
tree15 = RoseTree.singleton 15
tree16 = RoseTree.singleton 16

tree121 = RoseTree.singleton 121
tree122 = RoseTree.singleton 122
tree123 = RoseTree.singleton 123
tree124 = RoseTree.singleton 124
tree125 = RoseTree.singleton 125
tree126 = RoseTree.singleton 126

tree131 = RoseTree.singleton 131
tree132 = RoseTree.singleton 132
tree133 = RoseTree.singleton 133
tree134 = RoseTree.singleton 134
tree135 = RoseTree.singleton 135
tree136 = RoseTree.singleton 136

tree141 = RoseTree.singleton 141

completeTree14 = RoseTree.addChild tree141 tree14
completeTree13 = RoseTree.addChildren [tree131, tree132, tree133, tree134, tree135, tree136] tree13
completeTree12 = RoseTree.addChildren [tree121, tree122, tree123, tree124, tree125, tree126] tree12

result = RoseTree.addChildren [tree11, completeTree12, completeTree13, completeTree14, tree15, tree16] tree1
-}
