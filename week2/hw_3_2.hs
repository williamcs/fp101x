import Prelude hiding ((||))

-- right
--False || False = False
--_ || _ = True

-- right
--False || b = b
--True || _ = True

-- wrong
{-
b || c
  | b == c = True
  | otherwise = False
-}



-- right
{-
b || c
  | b == c = b
  | otherwise = True
-}

-- right
--b || False = b
--_ || True = True

-- right
{-
b || c
  | b == c = c
  | otherwise = True
-}

-- wrong
b || True = b
_ || True = True










