fibs :: [Integer]
fibs = 0 : 1 : [x + y | (x, y) <- zip fibs (tail fibs)]

fib :: Int -> Integer

{-wrong
fib n = last (take n fibs)
-}

{-wrong
fib n = head (drop (n - 1) fibs)
-}

--right
fib n = fibs !! n


{-wrong
-- answer d
fib n = index fibs n
-}