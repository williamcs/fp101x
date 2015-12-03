qsort [] = []
qsort xs = x : qsort larger ++ qsort smaller
  where x = minimum xs
        smaller = [a | a <- xs, a < x]
        larger = [b | b <- xs, b >= x]