module Unique exposing (Unique, unique)


type Unique
    = UniqueImpl Float


unique : () -> Unique
unique _ =
    UniqueImpl (0/0)