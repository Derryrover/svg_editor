module Graph exposing (..)

import List exposing(map, foldr)
import RoseTree
import RoseTreeItem

{-| RoseTree type.
A rosetree is a tree with a root whose children are themselves
rosetrees.

type RoseTree a
    = Rose a (List (RoseTree a))
-}

type alias Name = String
type alias UniqueId = String
type alias Type = String

type alias Atom x = {
  name: Name,
  id: UniqueId,
  body: x
}

type alias PureSynaps = {
  synapsType: Type
}

type alias PureNodeBody = RoseTree.RoseTree RoseTreeItem.Model

type alias Input = Atom PureSynaps
type alias Output = Atom PureSynaps
type alias NodeBody = Atom PureNodeBody


type alias PureNode = {
  inputs: List Input,
  outputs: List Output,
  body: NodeBody
}

type alias Node = Atom PureNode

type alias Connection = {
  fromNode: UniqueId,
  toNode: UniqueId,
  fromOutput: UniqueId,
  toInput: UniqueId
}

type alias PureGraph = {
  nodes: List Node,
  connections: List Connection
}

type alias Graph = Atom PureGraph




{-
singleton : a -> RoseTree a
singleton a =
    Rose a []



root : RoseTree a -> a
root (Rose a _) =
    a
-}
