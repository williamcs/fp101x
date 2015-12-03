fibs :: [Integer]

{-wrong
fibs = 1 : [x + y | (x, y) <- zip fibs (tail fibs)]
-}

{-wrong
fibs = 0 : 1 : zipWith (*) fibs (tail fibs)
-}

{-right
fibs = 0 : 1 : [x + y | (x, y) <- zip fibs (tail fibs)]
-}

--wrong
fibs = 1 : 1 : [x + y | (x, y) <- zip (tail fibs) fibs]