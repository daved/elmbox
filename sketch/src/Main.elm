module Main exposing (Model, Msg, main)

import Browser
import El
import Element
import Html exposing (Html)
import Process
import Task


type alias Model =
    { count : Int
    , message : String
    }


initialModel : () -> ( Model, Cmd msg )
initialModel _ =
    ( { count = 0
      , message = ""
      }
    , Cmd.none
    )


type Msg
    = Ping
    | ClearPing
    | Increment
    | Decrement


elMsg : El.Msg -> Msg
elMsg msg =
    case msg of
        El.Ping ->
            Ping

        El.Increment ->
            Increment

        El.Decrement ->
            Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Ping ->
            ( { model | message = "ping" }
            , Process.sleep 6000.0 |> Task.perform (\_ -> ClearPing)
            )

        ClearPing ->
            ( { model | message = "" }, Cmd.none )

        Increment ->
            ( { model | count = model.count + 1 }, Cmd.none )

        Decrement ->
            ( { model | count = model.count - 1 }, Cmd.none )


view : Model -> Html Msg
view model =
    Element.layout [] <|
        Element.column []
            [ Element.map elMsg <| El.incDecPanel model.count
            , Element.map elMsg <| El.pingPanel model.message
            ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main =
    Browser.element
        { init = initialModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
