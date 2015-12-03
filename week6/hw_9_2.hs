import Data.List
import Data.Char
import Hugs.IOExts (unsafeCoerce)
data Nat = Zero | Succ Nat deriving Show

add :: Nat -> Nat -> Nat

{-right
add Zero n = n
add (Succ m) n = Succ (add n m)
-}

{-right
add (Succ m) n = Succ (add n m)
add Zero n = n
-}

{-wrong
add Zero n = Zero
add (Succ m) n = Succ (add m n)
-}

{-wrong
add (Succ m) n = Succ (add m n)
add Zero n = Zero
-}

{-wrong
-- answer e
adde n Zero = Zero
adde n (Succ m) = Succ (adde n m)
-}

{-wrong
-- answer f
addf n (Succ m) = Succ (addf n m)
addf n Zero = Zero
-}

{-right
add n Zero = n
add n (Succ m) = Succ (add m n)
-}

--right
add n (Succ m) = Succ (add m n)
add n Zero = n
