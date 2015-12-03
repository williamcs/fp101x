-- right
--safetail xs = if null xs then [] else tail xs

-- rihgt
--safetail [] = []
--safetail (_ : xs) = xs

-- wrong
{-
safetail (_ : xs)
  | null xs = []
  | otherwise = tail xs
-}

-- right
{-
safetail xs 
  | null xs = []
  | otherwise = tail xs
-}

-- wrong
--safetail xs = tail xs
--safetail [] = []

-- right
--safetail [] = []
--safetail xs = tail xs

-- wrong
--safetail [x] = [x]
--safetail (_ : xs) = xs

-- right
safetail 
  = \ xs ->
      case xs of
          [] -> []
          (_ : xs) -> xs










