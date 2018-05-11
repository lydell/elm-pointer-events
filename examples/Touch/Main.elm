module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Touch


main : Program () TouchEvent TouchEvent
main =
    Browser.sandbox
        { init = None
        , view = view
        , update = \event _ -> event
        }


type TouchEvent
    = None
    | Start Touch.Event
    | Move Touch.Event
    | End Touch.Event
    | Cancel Touch.Event


view : TouchEvent -> Html TouchEvent
view event =
    div
        [ Touch.onStart Start
        , Touch.onMove Move
        , Touch.onEnd End
        , Touch.onCancel Cancel

        -- no touch-action
        , style "touch-action" "none"
        ]
        [ text <| Debug.toString event ]
