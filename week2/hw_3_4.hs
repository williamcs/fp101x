-- wrong
--mult x y z = \ x -> (\ y -> (\ z -> x * y * z))

-- wrong
mult = \ x -> (x * \y -> (y * \ z -> z))

-- right
--mult = \ x -> (\ y -> (\ z -> x * y * z))



