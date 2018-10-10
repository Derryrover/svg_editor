module RoseTreeBuilder exposing(result)

import RoseTree exposing(..)
import RoseTreeItem exposing(init)

tree1  = RoseTree.singleton (init 1)
tree11 = RoseTree.singleton (init 11)
tree12 = RoseTree.singleton (init 12)
tree13 = RoseTree.singleton (init 13)
tree14 = RoseTree.singleton (init 14)
tree15 = RoseTree.singleton (init 15)

tree151 = RoseTree.singleton (init 151)

tree15Complete = RoseTree.addChild tree151 tree15

result = RoseTree.addChildren [tree11, tree12, tree13, tree14, tree15Complete] tree1
