use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data NumList:
  | nl-empty
  | nl-link(first :: Number, rest :: NumList)
end

n1 = nl-empty
n2 = nl-link(3, nl-empty)
n3 = nl-link(7, nl-link(3, nl-empty))
n4 = nl-link(2, nl-link(7, nl-link(3, nl-empty)))

#|
fun num-list-fun(nl :: NumList) -> ???:
  cases (NumList) nl:
    | nl-empty => ...
    | nl-link(first, rest) =>
      ... first ...
      ... num-list-fun(rest) ...
  end
end
|#

fun num-7s(nl :: NumList) -> Number:
  cases (NumList) nl:
    | nl-empty => 0
    | nl-link(first, rest) =>
      if first == 7:
        num-7s(rest) + 1
      else:
        num-7s(rest)
      end
  end
where:
  num-7s(nl-empty) is 0
  num-7s(nl-link(0, nl-empty)) is 0
  num-7s(nl-link(7, nl-empty)) is 1
  num-7s(nl-link(0, nl-link(7, nl-empty))) is 1
  num-7s(nl-link(0, nl-link(7, nl-link(7, nl-empty)))) is 2
end

fun contains-n(l :: NumList, n :: Number) -> Boolean:
  doc: "returns whether that number is in the NumList."
   cases (NumList) l:
    | nl-empty => false
    | nl-link(first, rest) =>
      if first == n:
        true
      else:
        contains-n(rest, n) 
      end
  end
where:
  contains-n(n1, 1) is false
  contains-n(n2, 7) is false
  contains-n(n2, 3) is true
end
  

 fun total-sum(n :: NumList) -> Number:
  doc: "returns the sum of all the numbers in it."
  cases (NumList) n:
      | nl-empty => 0
      | nl-link(first, rest) => 
      first + total-sum(rest) 
  end 
where:
  total-sum(n1) is 0
  total-sum(n2) is 3
  total-sum(n3) is 10
end

fun remove-3(n :: NumList) -> NumList block:
  doc: "rreturns a new NumList with any 3's removed"
  cases (NumList) n:
    | nl-empty => nl-empty
      | nl-link(first, rest) => 
      if first <> 3:
        nl-link(first, remove-3(rest))
      else:
        remove-3(rest)
      end
  end
  
where:
  remove-3(n1) is nl-empty
  remove-3(n2) is nl-empty
  remove-3(n3) is nl-link(7, nl-empty)
end