use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

unique-codes = L.distinct(discount-codes)

fun is-real-code(c :: String) -> Boolean:
  doc: "returns whether code is not some version of none"
  not(string-to-lower(c) == "none")
where:
  is-real-code("NONE") is false
  is-real-code("none") is false
  is-real-code("vip") is true
end

real-codes = L.filter(is-real-code, unique-codes)

first-code = L.get(real-codes, 0)

s = L.map(string-to-lower, real-codes)

clean = L.map(string-to-upper, real-codes)

survey = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]
unique-survey = L.distinct(survey)
f = L.map(string-to-lower, survey)
c = L.filter(lam(c): not(c == "maybe") end, f)

  products =
  table: name :: String, price :: Number
    row: "laptop", 999.99
    row: "mouse", 25.50
    row: "keyboard", 75.00
    row: "monitor", 299.99
  end

get-products = get-column(products, "price")
g = L.filter(lam(b): b < 100 end, get-products)
h = L.map(lam(d): i = d * 0.10 
  d - i  end, g)


