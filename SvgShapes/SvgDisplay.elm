module SvgDisplay exposing (view)

import RoseTree exposing(..)
import RoseTreeItem exposing (..)
import Html exposing (..)
import Svg exposing (circle, line, svg, g)
import Svg.Attributes exposing (..)

import SvgCircle exposing(..)

view tree = svg [ viewBox "0 0 100 100", width "300px" ] [drawLayer tree]

drawLayer tree =
  let
    treeCircle = (RoseTree.root tree).item
    children = RoseTree.children tree
    translateXY = "translate("++ (toString treeCircle.x) ++" "++ (toString treeCircle.y) ++")"
  in
    g
      [transform translateXY]
      ( ( circle [cx "0", cy "0", r "5", fill "#FF0000"][])
        ::
        (List.map drawLayer children) )

