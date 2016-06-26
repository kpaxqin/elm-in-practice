import Html.App exposing (beginnerProgram)
import Counter

main = beginnerProgram {
  model = Counter.initModel,
  view = Counter.view,
  update = Counter.update}
