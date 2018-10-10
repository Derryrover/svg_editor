module RoseTreeTest exposing(..)

import RoseTree exposing(..)

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

completeTree1 = RoseTree.addChildren [tree11, completeTree12, completeTree13, completeTree14, tree15, tree16] tree1

childrenCompleteTree1 = RoseTree.children completeTree1
rootCompleteTree1 = RoseTree.root completeTree1

addOne n = n + 1
increasedCompleteTree1 = RoseTree.map addOne completeTree1
