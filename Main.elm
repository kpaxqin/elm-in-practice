import Html exposing (..)
import Html.Events exposing (onClick)
import Html.App as App

type alias Model = Int

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1
    Decrement ->
      model - 1

view : Model -> Html Msg
view model =
  div []
    [ button [onClick Decrement] [text "-"]
    , text (toString model)
    , button [onClick Increment] [text "+"]
  ]

initModel : Model
initModel = 3

main = App.beginnerProgram {model = initModel, view = view, update = update}
