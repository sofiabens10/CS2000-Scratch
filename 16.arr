use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

var cnt = 0
fun every-third-element(lst :: List) -> List block:
  var output = [list: ]
  for each(elt from lst) block:
    when num-modulo(cnt, 3) == 0:
      output := output + [list: elt]
    end
    cnt := cnt + 1
  end
  output
where:
  every-third-element([list: ]) is [list: ] #cnt is 0
  every-third-element([list: 1, 3, 5]) is [list: 1] #cnt is 3
  every-third-element([list: 1,3,5,7,11]) is [list: 1, 7] #cnt is 8
end


var score = 10
fun bonus-points(amt :: Number) -> Number block:
  score := score + amt
  penalty-check()
end
fun penalty-check() -> Number block:
  when score > 15:
    score := score - 3
  end
  score
end

   bonus-points(2) #score is 12
   bonus-points(4) #score is 13
   bonus-points(1) #score is 14


var dta = [list: 1, 2, 3]
var position = 0
fun advance() -> Number block:
  result = dta.get(position)
  position := position + 1
  when position >= length(dta) block:
    position := 0
    dta := [list: 0] + dta
  end
  result
end
fun process-data() -> Number block:
  first = advance() 
  second = advance()
  first + second
end

process-data() # 1 + 2
process-data() # 0 + 3
process-data() # 3 + 0

