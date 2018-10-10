module Tests.Unique exposing (suite)

import Expect exposing (Expectation)
import Test exposing (..)
import Unique


suite : Test
suite =
    describe "unique"
        [ test "same unique value" <|
            \() ->
                let
                    u =
                        Unique.unique ()
                in
                u
                    |> Expect.equal u
        , test "different unique values" <|
            \() ->
                Unique.unique ()
                    |> Expect.notEqual (Unique.unique ())
        , test "same object with nested unique value" <|
            \() ->
                let
                    u =
                        { a = 16
                        , u = Unique.unique ()
                        }
                in
                u
                    |> Expect.equal u
        , test "different objects with nested unique values" <|
            \() ->
                let
                    u _ =
                        { a = 16
                        , u = Unique.unique ()
                        }
                in
                u ()
                    |> Expect.notEqual (u ())
        ]
