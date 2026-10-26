use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data PaymentMethod:
  | cash
  | credit(number :: String, expiration :: String)
  | checking(account :: String, routing :: String, check-number :: Number)
end

payment1 = cash
payment2 = credit("4747-4747-4747-4747", "10-20")
payment3 = checking("1234", "5678", 100)

payment2.expiration

fun display-pm(p :: PaymentMethod) -> String:
  doc: "summary of how paid"
  cases(PaymentMethod) p:
    | cash => "Paid in cash"
    | credit(nm, exp) => "Paid via credit expiring " + exp
    | checking(acc, rout, check-nm) => "Paid via check from account " + acc
  end
where:
    display-pm(payment1) is "Paid in cash"
    display-pm(payment2) is "Paid via credit expiring 10-20"
    display-pm(payment3) is "Paid via check from account 1234"
end

# Define a Vehicle data type with three variants: bike (no fields), car (with make and year fields), and truck (with make, year, and capacity fields). Create one example of each variant.

data Vehicle:
  | bike
  | car(make :: String, year :: Number)
  | truck(make :: String, year :: Number, capacity :: String)
end

vehicle1 = bike
vehicle2 = car("Audi", 2014)
vehicle3 = truck("Ford F-150", 2015, "3,300 lbs")


# Write a function vehicle-age that takes a Vehicle and the current year, and returns the age in years. For bikes, return 0.

fun vehicle-age(v :: Vehicle, y :: Number) -> Number:
  doc: "returns the age of the vehicle in years"
  cases(Vehicle) v:
    | bike => 0
    | car(m, yr) => y - yr
    | truck(m, yr, c) => y - yr
  end
where:
  vehicle-age(vehicle1, 2026) is 0
  vehicle-age(vehicle2, 2026) is 12
  vehicle-age(vehicle3, 2026) is 11
end

# Define a Grade data type with variants: letter (with a string field for A/B/C/D/F), percent (with a number field), and pass-fail (with a boolean field). Create examples of each.
data Grade:
  | letter(gl :: String)
  | percent(per :: Number)
  | pass-fail(pf :: Boolean)
end

grade1 = letter("A")
grade2 = percent(70)
grade3 = pass-fail(false)


# Write a function grade-to-gpa that converts any Grade to a 4.0 scale number. Use: A=4.0, B=3.0, C=2.0, D=1.0, F=0.0; percentages: 90+=4.0, 80-89=3.0, 70-79=2.0, 60-69=1.0, <60=0.0; pass-fail: pass=4.0, fail=0.0.

fun grade-to-gpa(g :: Grade) -> Number:
  doc: "converts any Grade to a 4.0 scale number"
  cases(Grade) g:
    | letter(gr) => 
      if gr == "A":
        4.0
      else if gr == "B":
        3.0
      else if gr == "C":
        2.0
      else if gr == "D":
        1.0
      else:
        0.0
      end
    | percent(gra) =>
      if gra >= 90:
        4.0
      else if gra >= 80:
        3.0
      else if gra >= 70:
        2.0
      else if gra >= 60:
        1.0
      else:
        0.0
      end
    | pass-fail(grd) =>
      if grd == true:
        4.0
      else:
        0.0
      end
  end
where:
  grade-to-gpa(grade1) is 4.0
  grade-to-gpa(grade2) is 2.0
  grade-to-gpa(grade3) is 0.0
end

#Write a function payment-summary that takes a PaymentMethod and returns a string: "Cash payment", "Card ending in XXXX" (last 4 digits), or "Check #NNNN" (check number).
fun payment-summary(p :: PaymentMethod) -> String:
  doc: "returns a string: Cash payment , Card ending in XXXX , or Check NNNN."
    cases(PaymentMethod) p:
    | cash => "Cash payment"
    | credit(nm, exp) => "Card ending in " + string-substring(nm, 15, 19)
    | checking(acc, rout, check-nm) => "Check #" + num-to-string(check-nm)
  end
where:
  payment-summary(payment1) is "Cash payment"
  payment-summary(payment2) is "Card ending in 4747"
  payment-summary(payment3) is "Check #100"
end
    
# Define a WeatherReport with variants: sunny (temperature only), rainy (temperature and precipitation amount), and snowy (temperature, precipitation, and wind speed). Write a function is-severe that returns true if: rainy with >2 inches, snowy with >30 mph wind, or sunny above 95°F.
data WeatherReport:
  | sunny(temp :: Number)
  | rainy(temp :: Number, prec :: Number)
  | snowy(temp :: Number, prec :: Number, wind :: Number)
end

fun is-severe(w :: WeatherReport) -> Boolean:
  doc: "returns true if: rainy with >2 inches, snowy with >30 mph wind, or sunny above 95°F."
  cases(WeatherReport) w:
    | sunny(t) => t > 95
    | rainy(t, p) => p > 2
    | snowy(t, p, ws) => ws > 30
  end
where:
  weather1 = sunny(95)
  weather2 = rainy(90, 4)
  weather3 = snowy(34, 2, 45)
  
  is-severe(weather1) is false
  is-severe(weather2) is true
  is-severe(weather3) is true
end