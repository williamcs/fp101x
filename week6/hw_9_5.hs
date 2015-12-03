
data Tree = Leaf Integer | Node Tree Tree
balanced :: Tree -> Bool


t :: Tree
t = Node (Node (Leaf 1)(Leaf 4)) (Node (Leaf 6)(Leaf 9))

{-wrong
leaves (Leaf x) = x
leaves (Node l r) = leaves l + leaves b
balanced (Leaf _) = True
balanced (Node l r) = abs (leaves l - leaves r) <= 1 || balanced l || balanced r
-}

{-
leaves (Leaf _) = True
leaves (Node l r) = leaves l + leaves r
balanced (Leaf _) = True
balanced (Node l r) = abs (leaves l + leaves r) <= 1
-}

{-
-- answer c
leavesc (Leaf _) = True
leavesc (Node l r) = leavesc l + leavesc r
balancedc (Leaf _) = True
balancedc (Node l r) = abs (leavesc l + leavesc r) <= 1
-}

--right
leaves (Leaf _) = 1
leaves (Node l r) = leaves l + leaves r
balanced (Leaf _) = True
balanced (Node l r) = abs (leaves l - leaves r) <= 1 || balanced l || balanced r
