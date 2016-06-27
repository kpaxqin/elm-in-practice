module CounterList exposing (Model, Msg, initModel, update, view)
import Html exposing (Html, div, button, text)
import Html.App as App
import Html.Events exposing (onClick)
import Counter

type alias IndexedCounter = {id: Int, counter: Counter.Model}
type alias Model = {uid: Int, counters: List IndexedCounter}

type Msg = Insert | Remove | Modify Int Counter.Msg

update : Msg -> Model -> Model
update msg model =
  case msg of
    Insert ->
      let
        id = model.uid + 1
      in
        {
          uid = id,
          counters = {id = id, counter = Counter.initModel} :: model.counters
        }
    Remove ->
      {model | counters = List.drop 1 model.counters}
    Modify id counterMsg ->
      let
        counterMapper = updateCounter id counterMsg
      in
        {model | counters = List.map counterMapper model.counters}

updateCounter : Int -> Counter.Msg -> IndexedCounter -> IndexedCounter
updateCounter id counterMsg indexedCounter =
  if id == indexedCounter.id
  then {indexedCounter | counter = Counter.update counterMsg indexedCounter.counter}
  else indexedCounter

view : Model -> Html Msg
view model =
  div []
    [ button [onClick Insert] [text "Insert"]
    , button [onClick Remove] [text "Remove"]
    , div [] (List.map showCounter model.counters)
    ]

showCounter : IndexedCounter -> Html Msg
showCounter ({id, counter} as indexedCounter) =
  App.map (\counterMsg -> Modify id counterMsg) (Counter.view counter)

initModel = {uid= 0, counters = [{id= 0, counter= Counter.initModel}]}
