module SvgDisplay exposing (..)

import RoseTree exposing(..)
import RoseTreeItem exposing (..)
import Html exposing (..)
import Svg exposing (circle, line, svg, g)
import Svg.Attributes exposing (..)

import SvgCircle exposing(..)


a=1

show = 1

view tree = svg [ viewBox "0 0 100 100", width "300px" ]
      [ circle [ cx "50", cy "50", r "45", fill "#FF7911" ] []
      , drawLayer tree
      ]

drawLayer tree =
  let
    treeCircle = (RoseTree.root tree).item
    children = RoseTree.children tree
  in
    g [ transform ("translate("++ (toString treeCircle.x) ++" "++ (toString treeCircle.y) ++")") ]
      (List.concat [[ circle [ cx "0", cy "0", r "5", fill "#FF0000" ] []]
      , (List.map drawLayer children)])
