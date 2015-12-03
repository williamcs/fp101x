-- reverse sorted version ok
{--
qsort [] = []
qsort (x : xs) = qsort larger ++ [x] ++ qsort smaller
    where smaller = [a | a <- xs, a <= x]
          larger = [b | b <- xs, b > x]
--}

-- can't reverse
{--
qsort [] = []
qsort (x : xs) = reverse (qsort smaller ++ [x] ++ qsort larger)
    where 
	smaller = [a | a <- xs, a <= x]
	larger = [b | b <- xs, b > x]
	 --}

{--
qsort [] = []
qsort (x : xs) = reverse (qsort larger ++ [x] ++ qsort smaller)
    where smaller = [a | a <- xs, a <= x]
          larger = [b | b <- xs, b > x]
--}

qsort [] = []
qsort (x : xs) = qsort larger ++ qsort smaller ++ [x]
	where x = minimum xs
	      smaller = [a | a <- xs, a <= x]
          larger = [b | b <- xs, b > x]
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  