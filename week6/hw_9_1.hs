import Data.List
import Data.Char
--import Hugs.IOExts (unsafeCoerce)

data Nat = Zero
         | Succ Nat
         deriving Show

--integerToNat :: Integer -> Nat

{-right
integerToNat 0 = Zero
integerToNat (n+1) = Succ (integerToNat n)
-}

{-wrong
integerToNat 0 = Succ Zero
integerToNat n = (Succ (integerToNat n))
-}

{-wrong
integerToNat n 
  = product [(unsafeCoerce c) :: Integer | c <- show n]
-}

{-wrong
integerToNat n = integerToNat n
-}

{-right
integerToNat (n+1) = Succ (integerToNat n)
integerToNat 0 = Zero
-}

{-right
integerToNat (n+1) = let m = integerToNat n in Succ m
integerToNat 0 = Zero
-}

{-wrong
integerToNat = head . m
  where {
        ; m 0 = [0]
        ; m (n + 1) = [sum [x | x <- (1 : m n)]]
        }
-}

--wrong
integerToNath :: Integer -> Nat
integerToNath = \n -> genericLength [c | c <- show n, isDigit c]



















