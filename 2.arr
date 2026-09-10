use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")



1 + 1
"hello!" + "cs2000"
"hello! " + "cs2000"

string-repeat("cat", 10)
overlay(circle(40, "solid", "blue"),
  triangle(30, "solid", "red"))
overlay(triangle(30, "solid", "blue"),
  circle(40, "solid", "red"))
rectangle(100, 20, "solid", "red")
rotate(50, rectangle(100, 20, "solid", "red"))
overlay(text("STOP!", 20, "white"), regular-polygon(40, 8, "solid", "red"))