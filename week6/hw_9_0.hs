--module Main (main) where
import Data.List
import Data.Char
--import Hugs.IOExts (unsafeCoerce)

data Nat = Zero
         | Succ Nat
         deriving Show

natToInteger :: Nat -> Integer

{-right
natToInteger Zero = 0
natToInteger (Succ n) = natToInteger n + 1
-}

{-right
natToInteger (Succ n) = natToInteger n + 1
natToInteger Zero = 0
-}

{-wrong
natToInteger n = natToInteger n
-}

{-right
natToInteger (Succ n) = 1 + natToInteger n
natToInteger Zero = 0
-}

{-right
natToInteger = head . m
  where m Zero = [0]
        m (Succ n) = [sum [x | x <- (1 : m n)]]
-}

-- right
natToInteger = \ n -> genericLength [c | c <- show n, c == 'S']

{-wrong
natToInteger = \n -> length [c | c <- show n, c == 'S']
-}














