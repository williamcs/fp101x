{--
qsort [ ] = [ ]
qsort (x : xs) = qsort smaller ++ [x ] ++ qsort larger
where
smaller = [a | a ? xs, a = x ]
larger = [b | b ? xs, b > x ]
--}

{--
quicksort [] = []
quicksort (x: xs) =
	let smallerSorted = quicksort [a | a <- xs, a <= x]
		biggerSorted = quicksort [a | a <- xs, a > x]
	in	smallerSorted ++ [x] ++ biggerSorted
--}

{--
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted 
--}

quicksort [] = []

quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
    where
        lesser  = filter (< p) xs
        greater = filter (>= p) xs