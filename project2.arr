use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include image
include reactors

num-of-guesses = 0
empty-tile = square(50, "outline", "grey")

example-row = beside(empty-tile, beside(empty-tile, beside(empty-tile, beside(empty-tile, empty-tile))))

initial-grid = above(example-row, above(example-row, above(example-row, above(example-row, above(example-row, example-row)))))

fun guess(, key :: String) -> :
  doc: ""
  if key == :
    
  else:
    
  end
end

fun draw-display(guesses :: Number) -> Image:
  doc: "displays the guesses on the grid and/or displays an empty grid if the game just started"
  if guess == 0:
    initial-grid
  else:
    # 
  end
draw-display(0)

wordle-reactor = reactor:
  init: initial-grid,
    to-draw: draw-display,
    on-key: 
end

interact(wordle-reactor)