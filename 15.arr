use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L

fun my-doubles(l :: List<Number>) -> List<Number> block:
  doc: "returns a new list where each element is twice what the corresponding element was in the original list."
  var result = [list: ]
  
  for each(n from l):
    result:= result + [list: n * 2]
  end
  result
where:
  my-doubles([list: 1, 2]) is [list: 2, 4]
  my-doubles([list: 3, 7, 10]) is [list: 6, 14, 20]
end

fun my-doubles-map(l :: List<Number>) -> List<Number> block:
  doc: "returns a new list where each element is twice what the corresponding element was in the original list."
  L.map(lam(x): x * 2 end, l)
  
where:
  my-doubles-map([list: 1, 2]) is [list: 2, 4]
  my-doubles-map([list: 3, 7, 10]) is [list: 6, 14, 20]
end


fun my-pos-nums(l :: List<Number>) -> List<Number> block:
  doc: "returns a new list that contains only positive nums from the original list"
  var positive = [list: ]
  
  for each(n from l):
    if n > 0:
      positive:= positive + [list: n]
      else:
      nothing
    end
  end
  positive
where:
  my-pos-nums([list: -1, 2]) is [list: 2]
  my-pos-nums([list: 3, -7, 10]) is [list: 3, 10]
end

fun my-pos-nums-filter(l :: List<Number>) -> List<Number> block:
  doc: "returns a new list that contains only positive nums from the original list"
  
  
where:
  my-pos-nums-filter([list: -1, 2]) is [list: 2]
  my-pos-nums-filter([list: 3, -7, 10]) is [list: 3, 10]
end