module El exposing (Msg(..), incDecBtn, incDecPanel, pingBtn, pingPanel)

import Element exposing (..)
import Element.Background as Background
import Element.Events exposing (..)
import Element.Font as Font


type Msg
    = Ping
    | Increment
    | Decrement


pingBtn : msg -> String -> Element msg
pingBtn msg content =
    el
        [ Background.color (rgb255 100 100 100)
        , Font.color (rgb255 255 255 255)
        , padding 30
        , onClick msg
        ]
        (text content)


pingPanel : String -> Element Msg
pingPanel content =
    row [ width fill, centerY, spacing 30 ]
        [ pingBtn Ping content ]


incDecPanel : Int -> Element Msg
incDecPanel count =
    row [ width fill, centerY, spacing 30 ]
        [ incDecBtn Decrement "-1"
        , el [ padding 30 ] (text <| String.fromInt count)
        , incDecBtn Increment "+1"
        ]


incDecBtn : msg -> String -> Element msg
incDecBtn msg label =
    el
        [ Background.color (rgb255 100 255 100)
        , Font.color (rgb255 255 255 255)
        , padding 30
        , onClick msg
        ]
        (text label)
