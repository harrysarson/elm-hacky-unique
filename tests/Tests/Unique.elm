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
        , test "same record with nested unique value" <|
            \() ->
                let
                    u =
                        { a = 16
                        , u = Unique.unique ()
                        }
                in
                u
                    |> Expect.equal u
        , test "different record with nested unique values" <|
            \() ->
                let
                    u _ =
                        { a = 16
                        , u = Unique.unique ()
                        }
                in
                u ()
                    |> Expect.notEqual (u ())
        , test "same custom type with nested unique value" <|
            \() ->
                let
                    u =
                        Just (Unique.unique ())
                in
                u
                    |> Expect.equal u
        , test "different custom type with nested unique values" <|
            \() ->
                let
                    u _ =
                        Just (Unique.unique ())
                in
                u ()
                    |> Expect.notEqual (u ())
        ]
