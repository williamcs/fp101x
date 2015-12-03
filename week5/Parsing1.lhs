Functional parsing library from chapter 8 of Programming in Haskell,
Graham Hutton, Cambridge University Press, 2007.


> module Parsing where
>
> import Char
> import Monad
>
> infixr 5 +++

The monad of parsers
--------------------

> newtype Parser a              =  P (String -> [(a,String)])
>
> instance Monad Parser where
>    return v                   =  P (\inp -> [(v,inp)])
>    p >>= f                    =  P (\inp -> case parse p inp of
>                                                []        -> []
>                                                [(v,out)] -> parse (f v) out)
> 
> instance MonadPlus Parser where
>    mzero                      =  P (\inp -> [])
>    p `mplus` q                =  P (\inp -> case parse p inp of
>                                                []        -> parse q inp
>                                                [(v,out)] -> [(v,out)])

Added by Fritz Ruehr, Willamette CS 465, Spr 2011, to reflect Hutton/Meijer paper:

> p `chainl1` op = do {a <- p; rest a}
>                  where rest a = do { f <- op; b <- p; rest (f a b) } +++ return a

> try (P p) str = case p str of
>                   [(x,[])] -> x
>                   _ -> error "failed or ambiguous parse; use \'parse\' to see results"

Basic parsers
-------------

> failure                       :: Parser a
> failure                       =  mzero
>
> item                          :: Parser Char
> item                          =  P (\inp -> case inp of
>                                                []     -> []
>                                                (x:xs) -> [(x,xs)])
> 
> parse                         :: Parser a -> String -> [(a,String)]
> parse (P p) inp               =  p inp

Choice
------

> (+++)                         :: Parser a -> Parser a -> Parser a
> p +++ q                       =  p `mplus` q

Derived primitives
------------------

> sat                           :: (Char -> Bool) -> Parser Char
> sat p                         =  do x <- item
>                                     if p x then return x else failure
> 
> digit                         :: Parser Char
> digit                         =  sat isDigit
> 
> lower                         :: Parser Char
> lower                         =  sat isLower
> 
> upper                         :: Parser Char
> upper                         =  sat isUpper
> 
> letter                        :: Parser Char
> letter                        =  sat isAlpha
> 
> alphanum                      :: Parser Char
> alphanum                      =  sat isAlphaNum
> 
> char                          :: Char -> Parser Char
> char x                        =  sat (== x)
> 
> string                        :: String -> Parser String
> string []                     =  return []
> string (x:xs)                 =  do char x
>                                     string xs
>                                     return (x:xs)
> 
> many                          :: Parser a -> Parser [a]
> many p                        =  many1 p +++ return []
> 
> many1                         :: Parser a -> Parser [a]
> many1 p                       =  do v  <- p
>                                     vs <- many p
>                                     return (v:vs)
> 
> ident                         :: Parser String
> ident                         =  do x  <- lower
>                                     xs <- many alphanum
>                                     return (x:xs)
> 
> nat                           :: Parser Integer
> nat                           =  do xs <- many1 digit
>                                     return (read xs)
>
> int                           :: Parser Integer
> int                           =  do char '-'
>                                     n <- nat
>                                     return (-n)
>                                   +++ nat
> 
> space                         :: Parser ()
> space                         =  do many (sat isSpace)
>                                     return ()

Ignoring spacing
----------------

> token                         :: Parser a -> Parser a
> token p                       =  do space
>                                     v <- p
>                                     space
>                                     return v
> 
> identifier                    :: Parser String
> identifier                    =  token ident
> 
> natural                       :: Parser Integer
> natural                       =  token nat
> 
> integer                       :: Parser Integer
> integer                       =  token int
>
> symbol                        :: String -> Parser String
> symbol xs                     =  token (string xs)
