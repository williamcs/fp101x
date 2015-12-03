import Data.Char

let2int :: Char -> Int
let2int c = ord c - ord 'a'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

up2int :: Char -> Int
up2int c = ord c - ord 'A'

int2up :: Int -> Char
int2up n = chr (ord 'A' + n)

shift :: Int -> Char -> Char
shift n c
  | isLower c = int2let ((let2int c + n) `mod` 26)
  | isUpper c = int2up ((up2int c + n) `mod` 26)
  | otherwise = c

encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

str = "Think like a Fundamentalist Code like a Hacker"

main = do
  let result = encode 13 str
  putStrLn result