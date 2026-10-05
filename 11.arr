use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end

#| input: table ->
   output: chart with counting:
   num of hot(>60) days
   num of mild (<=60 and >40) days
   num of cold (<=40) days
   
   1. normalize temp column
   2. add column with hot,mild,cold depending on temp column
   3. chart that columns 4/ free bar chart 
|#

fun norm-temp(v) -> Number:
  doc: " given number or string representing number, return that number"
  if is-string(v):
    string-to-number-unsafe(v)
  else:
    v
  end
where:
  norm-temp(10) is 10
  norm-temp("10") is 10
end 
  
  weather-norm = transform-column(weather-data, "temperature", norm-temp)
  
fun cat-temp(t :: Number) -> String:
    doc: "if t <= 40, 'cold', if between 40 and <=60, 'mild', otherwise 'hot'"
  if t <= 40:
    "cold"
  else if t <= 60:
    "mild"
  else:
    "hot"
  end
  where:
    cat-temp(35) is "cold"
    cat-temp(40) is "cold"
    cat-temp(50) is "mild"
    cat-temp(60) is "mild"
    cat-temp(61) is "hot"
    cat-temp(87) is "hot"
end 
      
weather-cat = build-column(weather-norm, "category", lam(r :: Row): cat-temp(get-column(r, "temperature")) end)

freq-bar-chart(weather-cat, "category")

fun norm-prec(s) -> Number:
  doc: " given number or string representing number, return that number"
  if num-is-negative(s):
    s * -1
  else:
    s
  end
where:
  norm-prec(-1) is 1
  norm-temp(1) is 1
end 
  
prec-norm = transform-column(weather-data, "precipitation", norm-prec)
#dry" (no rain), "drizzly" (< 1" of rain), and "wet" (>= 1" of rain)
fun cat-prec(b :: Number) -> String:
  doc: "if b = 0, 'dry', if b < 1, 'drizzly', otherwise 'wet'"
  if b == 0:
    "dry"
  else if b < 1:
    "drizzly"
  else:
    "wet"
  end
  where:
  cat-prec(0) is "dry"
  cat-prec(0.2) is "drizzly"
  cat-prec(1) is "wet"
end 
      
prec-cat = build-column(prec-norm, "category2", lam(r :: Row): cat-prec(get-column(r, "precipitation")) end)

freq-bar-chart(prec-cat, "category2")


employees =
  table: full-name :: String, department :: String
    row: "Jordan Smith", "Sales"
    row: "Alexandra Lee", "Engineering"
    row: "Sam", "Marketing"
    row: "Ng, Alice", "Operations"
  end