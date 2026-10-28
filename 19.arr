use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
#|
data List<A>:
  | empty
  | link(first :: A, rest :: List<A>)
end
|#

fun add-till-zero(l :: List<Number>) -> Number:
  doc: "adds numbers until first 0"
  cases(List) l:
    | empty => 0
    | link(f, r) => 
      if f == 0:
         0
      else:
        f + add-till-zero(r)
      end
  end
  
where:
  add-till-zero([list: 7,3,0,5]) is 
  [list: 7,3,0,5].first + add-till-zero([list: 7,3,0,5].rest)
  
  add-till-zero([list:   3,0,5]) is 
  3 + add-till-zero([list:     0,5])
  
  add-till-zero([list:     0,5]) is 
  0
  
  add-till-zero([list:       5]) is 
  5
  
  add-till-zero([list:        ]) is 0
end