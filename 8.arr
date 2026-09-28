use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


  items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
  row: "Amulet of Protection",    5,  -12
    row: "Orb of Wisdom",          -29,  -21
  end

fun calc-distance(r :: Row) -> Number:
  doc: "finds distance to origin from fields 'x-coordinate' and 'y-coordinate'"
  num-sqrt(num-sqr(get-column(r, "x-coordinate")) + num-sqr(get-column(r, "y-coordinate")))
where:
  calc-distance(get-row(items, 0)) is-roughly num-sqrt(num-sqr(23) + num-sqr(87))
  calc-distance(get-row(items, 8)) is 13
end

items-with-dist = build-column(items, "dist", calc-distance)

fun sub1(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n - 1
where:
  sub1(10) is 9
  sub1(-4.5) is -5.5
end

items-shifted = transform-column(items, "x-coordinate", sub1)

fun per10(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n * 0.10
where:
  per10(10) is 1
  per10(-4.5) is -0.45
end

new-shifted = transform-column(items, "x-coordinate", per10)
n2-shifted = transform-column(new-shifted, "y-coordinate", per10)

d = order-by(n2-shifted, "x-coordinate", true)
get-row(d, 0)

fun obs(item :: String) -> String:
  string-repeat("X", string-length(item))
end
transform-column(items, "item", obs)

employees = load-table: NAME,DEPARTMENT_NAME,TITLE,REGULAR,RETRO,OTHER,OVERTIME,INJURED,DETAIL,QUINN_EDUCATION,TOTAL_GROSS,POSTAL
source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)
end
fun earnings-to-number(s :: String) -> Number:
  doc: "Converts a possibly comma-formatted earnings string to a number, using 0 if empty or invalid"
  string-to-number-default(0)(string-replace(s, ",", ""))
where:
  earnings-to-number("1234") is 1234
  earnings-to-number("1,234") is 1234
  earnings-to-number("-1.3") is -1.3
  earnings-to-number("hello") is 0
end

employees-gross = transform-column(employees, "TOTAL_GROSS", earnings-to-number)