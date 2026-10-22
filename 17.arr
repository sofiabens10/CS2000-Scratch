use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv

data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end

the-dispossessed = book("The Dispossessed", "Ursula K. Le Guin", 387)
to-the-lighthouse = book("To the Lighthouse", "Virginia Woolf", 209)
brave-new-world = book("Brave New World", "Aldous Huxley", 268)

the-dispossessed.pages # evaluates to 387

fun BookRecord(s :: BookRecord) -> String:
  doc: "returns a 'summary string' for a BookRecord, including the title, author, and pages"
  s.title + ", " + s.author + ", " + num-to-string(s.pages)
where:
  BookRecord(the-dispossessed) is "The Dispossessed, Ursula K. Le Guin, 387"
end

fun is-long-book(s :: BookRecord) -> String:
  doc: "returns whether or not the book has more than 350 pages."
  if s.pages > 350:
    "The book has more than 350 pages"
  else:
    "The book has 350 pages or less"
  end
where:
  is-long-book(the-dispossessed) is "The book has more than 350 pages"
end

data Podcast:
  | podcast(title :: String, podcaster :: String, episode :: Number)
end

favorite = podcast("Anything Goes", "Emma Chamberlain", 36)

fun Podcast-summary(s :: Podcast) -> String:
  doc: "returns a 'summary string' for a Podcast, including the title, podcaster, and episode"
  s.title + ", " + s.podcaster + ", " + num-to-string(s.episode)
where:
  Podcast-summary(favorite) is "Anything Goes, Emma Chamberlain, 36"
end

data Recipe:
  | recipe(title :: String, servings :: String, prep-time :: String)
end

recipes-raw = load-table:
  title :: String,
  servings :: String,
  prep-time :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end
recipes-with-servings = transform-column(recipes-raw, "servings", string-to-number-default(0))
recipes = transform-column(recipes-with-servings, "prep-time", string-to-number-default(0))

fun row-to-recipe(r :: Row) -> Recipe:
  doc: "takes a row and makes it a recipe"
  recipe(get-column(r, "title"), get-column(r, "servings"), get-column(r, "prep-time"))
where:
  row-to-recipe(get-row(recipes-raw, 0)) is recipe("Classic Pancakes", "4", "15")
end

new-col = build-column(recipes-raw, "Recipe", row-to-recipe)