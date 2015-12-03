unfold p h t x
  | p x = []
  | otherwise = h x : unfold p h t (t x)

type Bit = Int

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

--int2bin = unfold (== 0) (`mod` 2) (`div` 2)

chop8 :: [Bit] -> [[Bit]]

{-
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)
-}

chop8 = unfold null (take 8) (drop 8)

map1 :: (a -> b) -> [a] -> [b]
map1 f = unfold null (f . head) tail

iterate1 :: (a -> a) -> a -> [a]
iterate1 f = unfold (const False) id f 