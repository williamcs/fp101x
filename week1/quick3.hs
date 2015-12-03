qsort [] = []
qsort (x : xs) = qsort larger ++ qsort smaller ++ [x]
    where x = minimum xs
          smaller = [a | a <- xs, a <= x]
          larger = [b | b <- xs, b > x]