-- [(x, y) | x <- [1, 2, 3], y <- [4, 5, 6]]

--[z | z <- [[(x, y) | y <- [4, 5, 6]] | x <- [1, 2, 3]]]

--concat [[[(x, y)] | x <- [1, 2, 3]] | y <- [4, 5, 6]]

--concat [(x, y) | y <- [4, 5, 6]] | x <- [1, 2, 3]

-- right
concat [[(x, y) | y <- [4, 5, 6]] | x <- [1, 2, 3]]