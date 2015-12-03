factors :: Int -> [Int]
factors n = [x | x <- [1 .. n ], n `mod` x == 0]

perfects :: Int -> [Int]
{- wrong
perfects n = [x | x <- [1 .. n], isPerfect x]
  where isPerfect num = sum (factors num) == num
-}

-- right
perfects n = [x | x <- [1 .. n], isPerfect x]
  where isPerfect num = sum (init (factors num)) == num


{- wrong
perfects n = [isPerfect x | x <- [1 .. n]]
  where isPerfect num = sum (init(factors num)) == num
-}

{- wrong
perfects n = [x | x <- [1 .. n], isPerfect x]
  where isPerfect num = init(factors num) == num
-}




