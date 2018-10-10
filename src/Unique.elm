module Unique exposing (Unique, unique)

{-| Create unique types in elm.

@docs Unique, unique

-}


{-| The unique type.
Any record or custom type containing `Unique` values will only compare as equal
if they are exactly the same object.

See the README for an example.

-}
type Unique
    = UniqueImpl Float


{-| Generate unique types.
-}
unique : () -> Unique
unique _ =
    UniqueImpl (0 / 0)
