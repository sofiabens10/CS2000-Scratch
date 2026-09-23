use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv

workouts = table: date :: String, activity :: String, duration :: Number 
  row: "2026=04=01", "Running", 30
  row: "2026-04-02", "Yoga", 45
  row: "2026-04-03", "Cycling", 60
end

recipes = load-table: title :: String, servings :: Number, prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end

recipe = get-row(recipes, 23)
recipe
get-column(recipe, "servings")


table = load-table: month-year :: Number, area :: String, borough :: String, Area-Name :: String, Area-Code :: String, Crime-Type :: String, Crime-Subtype :: String, Measure :: String, Financial-Year :: String, Count :: Number, Refresh-Date :: Number
  source: csv-table-url("https://data.london.gov.uk/download/e5n6w/qbc/M1045_MonthlyCrimeDashboard_KnifeCrimeData.csv", default-options)
end

rot = get-row(table, 23)
rot
get-column(rot, "area")
table-length(table)