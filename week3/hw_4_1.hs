--rep n a = [True | _ <- [1 .. n]]

--rep n a = [n | _ <- [1 .. n]]

rep n a = [a | _ <- [1 .. a]]

--rep n a = [a | _ <- [1 .. n]]