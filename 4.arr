use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


fun welcome(name :: String) -> String:
  doc: "returns a greeting addressed to the given person"
  "Welcome to class " + name
end

fun three-layer-cake(top :: String, middle :: String, bottom :: String) -> Image:
  doc: "returns an image of a three tier flavorful cake"
  
  above(rectangle(60, 40, "solid", top), above(rectangle(60, 40, "solid", middle), rectangle(60, 40, "solid", bottom)))
end

CPL= 0.10
CPS = 5
fun tshirt-cost(amount :: Number, message :: String) -> Number:
  doc: "calculates the cost of printing shirts which is $5 per shirt and $0.10 per letter in the message"
  (amount * CPS) + (string-length(message) * CPL)
end
 
fun nm-square(n :: Number) -> Number:
  doc: "Multiplies the input by itself"
  n * n

where:
  nm-square(-1) is 1
  nm-square(0) is 0
  nm-square(2) is 4
end