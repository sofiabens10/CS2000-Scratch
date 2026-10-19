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
  
  fun is-pos(n :: Number) -> Boolean:
    n > 0
  end
  
L.filter(is-pos, l)
  
where:
  my-pos-nums-filter([list: -1, 2]) is [list: 2]
  my-pos-nums-filter([list: 3, -7, 10]) is [list: 3, 10]
end






fun my-alternating(l :: List<Number>) -> List<Number> block:
  doc: "returns a new list that contains every other element"
  var result = [list: ]
  var alteration = 0
  
  for each(n from l) block:
    if num-modulo(alteration, 2) == 0:
    result:= result + [list: n]
    else: 
      nothing
    end
    alteration := alteration + 1
  end
  result
where:
  my-alternating([list: 1, 2]) is [list: 1]
  my-alternating([list: 3, 7, 10]) is [list: 3, 10]
end

# I don't think so because there is an additional counter (alteration) varaiable.





fun my-running-sum(l :: List<Number>) -> List<Number> block:
  doc: "returns a list where each position contains a sum of the numbers in the original list up to the corresponding position"
  var result = [list: ]
  var counter = 0
  
  for each(n from l) block:
    if counter == 0 block:
      result:= result + [list: n]
      counter := counter + 1
    else:
      x = result.get(counter - 1)
      result:= result + [list: n + x]
      counter := counter + 1
    end
  end
   
  result
  
where:
  my-running-sum([list: 1, 2]) is [list: 1, 3]
  my-running-sum([list: 3, 7, 10]) is [list: 3, 10, 20]
end

# probably not