use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


blue-square = rectangle(40, 40, "solid", "blue")
blue-square

radius = 10
area = 3.14 * radius * radius
area
radius
# radius = 10
len = 35
cone = "purple"
ortri = triangle(len, "solid", cone)
ortri
sid = 40
sun = "yellow"
sq = square(sid, "solid", sun)
sq
square(40, "solid", "yellow")
#sid = 40
height = 70
wide = 50
cat = "black"
rect = rectangle(wide, height, "solid", cat)
rad = 5
cir = circle(rad, "solid", sun)
overlay(cir,rect)
combine = beside(cir, cir)
overlay(combine, rect)
berry = "blue"
blue = rectangle(height, wide, "solid", berry)
yellow = rectangle(height, wide, "solid", sun)
flag = above(blue, yellow)
flag
mor = rectangle(100, 80, "solid", "red")
funn = star(30, "outline", "green")
fl2 = overlay(funn, mor)
fl2