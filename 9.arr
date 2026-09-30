use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
s = table: x-coord :: Number, y-coord :: Number
  row: 1, 2
  row: 3, 4
end

transform-column(s, "x-coord", lam(n :: Number) -> Number: n - 1 end)

fun apply-discounts(t :: Table) -> Table:
  doc: "transforms 'price' column by reducing 20%, if value is below 100"
  transform-column(t, "price", lam(price :: Number) -> Number: 
    if price < 100: price * 0.8 else: price end
  end)
where:
  teste =
    table: price
      row: 50
      row: 120
      row: 80
      row: 40
    end
  apply-discounts(teste) is
  table: price
    row: 50 * 0.8
    row: 120
    row: 80 * 0.8
    row: 40 * 0.8
  end
end

prices = table: price
      row: 50
      row: 120
      row: 80
      row: 40
      row: 50
      row: 80
      row: 80
    end
freq-bar-chart(prices, "price")

#| Question | Answer | 
   What type of information is shared? contact information, education, work history, location, etc.
   Who is the subject of the information?  The applicant
   Who is the sender of the information?  The applicant
   Who are the potential recipients of the information? Shamazon workers, software engineers
   What principles govern the collection and transmission of this information?  Shamazon will not share an applicant information with third parties |#


fun add-tax(row :: Row) -> Number:
  doc: "calculates the sales tax for a given row's price"
  row["price"] * 0.05
end

prices-with-tax = build-column(prices, "Tax", add-tax)

fun obs(item :: String) -> String:
  doc: "obfuscates a string by replacing each character with 'X'"
  string-repeat("X", string-length(item))
end

test-table = table: item
  row: "apple"
  row: "cat"
end

obfuscated = transform-column(test-table, "item", obs)