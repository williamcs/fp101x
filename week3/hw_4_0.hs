sum100 = sum [x ^ 2 | x <- [1 .. 100]]

-- wrong
--sum100 = sum [const 2 x | x <- [1 .. 100]]

-- wrong
--sum100 = foldl (+) (1) [x ^ 2 | x <- [1 .. 100]]