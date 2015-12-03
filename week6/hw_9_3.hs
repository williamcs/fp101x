
import Data.List
import Data.Char
import Hugs.IOExts (unsafeCoerce)
data Nat = Zero | Succ Nat deriving Show

add Zero n = n
add (Succ m) n = Succ (add n m)

mult :: Nat -> Nat -> Nat

{-wrong
mult Zero Zero = Zero
mult m (Succ n) = add m (mult m n)
-}

{-right
mult m Zero = Zero
mult m (Succ n) = add m (mult m n)
-}

{-wrong
mult m Zero = Zero
mult m (Succ n) = add n (mult m n)
-}

--wrong
mult m Zero = Zero
mult m n = add m (mult m (Succ n))