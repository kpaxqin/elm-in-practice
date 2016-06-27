import Html.App exposing (beginnerProgram)
import CounterList

main = beginnerProgram {
  model = CounterList.initModel,
  view = CounterList.view,
  update = CounterList.update}
