use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include image
include reactors

empty-tile = square(50, "outline", "grey")

example-row = beside(empty-tile, beside(empty-tile, beside(empty-tile, beside(empty-tile, empty-tile))))

initial-grid = above(example-row, above(example-row, above(example-row, above(example-row, above(example-row, example-row)))))

wordle-reactor = reactor:
  init: initial-grid
end

interact(wordle-reactor)