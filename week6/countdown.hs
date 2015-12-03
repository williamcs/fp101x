import System.CPUTime
import Numeric
import System.IO

-- Expressions
--------------

data Op = Add | Sub | Mul | Div

valid :: Op -> Int -> Int -> Bool
valid Add _ _ = True
valid Sub x y = x > y
valid Mul _ _ = True
valid Div x y = x `mod` y == 0

apply :: Op -> Int -> Int -> Int
apply Add x y = x + y
apply Sub x y = x - y
apply Mul x y = x * y
apply Div x y = x `div` y

data Expr = Val Int | App Op Expr Expr

values :: Expr -> [Int]
values (Val n) = [n]
values (App _ l r) = values l ++ values r

eval :: Expr -> [Int]
eval (Val n) = [n | n > 0]
eval (App o l r) = [apply o x y | x <- eval l
                                , y <- eval r
                                , valid o x y]

-- Combinatorial functions
--------------------------

subs :: [a] -> [[a]]
subs [] = [[]]
subs (x:xs) = yss ++ map (x:) yss
              where yss = subs xs

interleave :: a -> [a] -> [[a]]
interleave x [] = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)


perms :: [a] -> [[a]]
perms [] = [[]]
perms (x:xs) = concat (map (interleave x) (perms xs))

choices :: [a] -> [[a]]

{-wrong
choices xs = [ys ++ zs | ys <- subs xs, zs <- perms xs]
-}

{-wrong
choices xs = concat [zs | ys <- subs xs, zs <- perms ys]
-}

--right
choices xs = [zs | ys <- subs xs, zs <- perms ys]


{-wrong
choices xs = [zs | ys <- perms xs, zs <- subs ys]
-}

--removes the first occurence of a given element from a list
removeone :: Eq a => a -> [a] -> [a]

{-wrong
removeone x [] = [x]
removeone x ys
  | x == head ys = ys
  | otherwise = y : removeone x ys
-}

{-wrong
removeone x [] = []
removeone x (y : ys)
  | x == y = ys
  | otherwise = x : removeone y ys
-}

{-wrong
removeone x [] = []
removeone x ys
  | x == head ys = ys
  | otherwise = removeone x ys
-}

--right
removeone x [] = []
removeone x (y : ys)
  | x == y = ys
  | otherwise = y : removeone x ys

--isChoice that decides whether one list is chosen from another
isChoice :: Eq a => [a] -> [a] -> Bool

--right
isChoice [] _ = True
isChoice (x : xs) [] = False
isChoice (x : xs) ys = elem x ys && isChoice xs (removeone x ys)


{-wrong
isChoice [] _ = True
isChoice (x : xs) [] = False
isChoice (x : xs) ys = elem x ys && isChoice (removeone x xs) ys
-}

--Formalising the problem
-----------------------




--Brute force solution
--------------------

split :: [a] -> [([a], [a])]

{-wrong
split [] = []
split [x] = [x]
split (x : xs) = [([x] : (ls ++ rs)) | (ls, rs) <- split xs]
-}


{-wrong
split [] = []
split (x : xs) = ([x], xs) : (split xs)
-}


{-wrong
split [] = []
split (x : xs) = [(x : ls, rs) | (ls, rs) <- split xs]
-}

--right
split [] = []
split [_] = []
split (x : xs) = ([x], xs) : [(x : ls, rs) | (ls, rs) <- split xs]
















