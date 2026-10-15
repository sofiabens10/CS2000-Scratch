use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


fun product(l :: List<Number>) -> Number block:
  doc:"mulitplies the list"
  var my-total = 1
  
  for each(n from l):
    my-total := my-total * n
  end
  my-total
where:
  product([list: 1]) is 1
  product([list: 1, 2]) is 2
end


fun sum-even-numbers(l :: List<Number>) -> Number block:
  doc:"adds only even numbers"
  var my-total = 0
  
  for each(n from l):
    if num-modulo(n, 2) == 0:
    my-total := my-total + n
    else:
      nothing
    end
  end
  my-total
where:
  sum-even-numbers([list: 1]) is 0
  sum-even-numbers([list: 1, 2]) is 2
end


fun my-length(l :: List<Number>) -> Number block:
  doc:"returns length of list"
  var len = 0
  
  for each(n from l):
    len := len + 1
  end
  len
where:
  my-length([list: 1]) is 1
  my-length([list: 1, 2]) is 2
end

fun any-negative(l :: List<Number>) -> Boolean block:
  doc:"returns true if there is at least one negative number in the list, false otherwise."
  var negative = false
  
  for each(n from l):
    if n < 0:
      negative := true
      else:
      nothing
      end
  end
  negative
where:
  any-negative([list: 1]) is false
  any-negative([list: -1, 2]) is true
end