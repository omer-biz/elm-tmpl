module Main exposing (main)

import Browser
import Browser.Events
import Html exposing (Html, p, text)


type Msg
    = UpdateWindowSize WindowSize


type alias WindowSize =
    { width : Int, height : Int }


type alias Model =
    { windowSize : WindowSize }


type alias Flags =
    WindowSize


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Browser.Events.onResize (\w h -> UpdateWindowSize { width = w, height = h })


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateWindowSize size ->
            ( { model | windowSize = size }, Cmd.none )


view : Model -> Html Msg
view model =
    let
        size =
            model.windowSize

        width =
            String.fromInt size.width

        height =
            String.fromInt size.height
    in
    p [] [ text <| "The window's size is (" ++ width ++ ", " ++ height ++ ")" ]


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { windowSize = { width = flags.width, height = flags.height } }, Cmd.none )
