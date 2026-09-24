use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

high-value-orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "10:15", 8.00
end

fun is-high-value(r :: Row) -> Boolean:
  doc: "returns whether the amount column is >= 8"
  get-column(r, "amount") >= 8
where:
  is-high-value(get-row(orders, 0)) is true
  is-high-value(get-row(orders, 1)) is false
  is-high-value(get-row(orders, 2)) is true
end

new-high-orders = filter-with(orders, is-high-value)

check:
  new-high-orders is high-value-orders
end

order-by(orders, "amount", true)

fun is-morning(r :: Row) -> Boolean:
  doc: "returns True if the time is in the morning"
  get-column(r, "time") < "12:00"
where:
  is-morning(get-row(orders, 0)) is true
  is-morning(get-row(orders, 3)) is true
  is-morning(get-row(orders, 5)) is false
end

order-by(orders, "time", false)

latest-morning-order = filter-with(orders, is-morning)

c = order-by(latest-morning-order, "time", false)
get-row(c, 0)



table = load-table: location :: String, subject :: String, date :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end

fun is-forest(r :: Row) -> Boolean:
  doc: "returns True if thing is a forest"
  get-column(r, "subject") == "Forest"
where:  
  is-forest(get-row(table, 0)) is false
  is-forest(get-row(table, 12)) is true
end

only-forest = filter-with(table, is-forest)
d = order-by(only-forest, "date", true)
get-row(d, 0)