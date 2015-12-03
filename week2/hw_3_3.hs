import Prelude hiding ((&&))

-- right
--True && True = True
--_ && _ = False

-- right
--a && b = if a then if b then True else False else False

--wrong
--a && b = if not (a) then not (b) else True

--wrong
--a && b = if a then b

--wrong
--a && b = if a then if b then False else True else False

-- right
--a && b = if a then b else False

-- right
a && b = if b then a else False



