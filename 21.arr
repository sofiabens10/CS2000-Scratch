use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

# Example: A small river network
stream-a = stream(5)
stream-b = stream(8)
stream-c = stream(3)
merge-1 = merge(12, stream-a, stream-b)
main-river = merge(15, merge-1, stream-c)

#|
fun river-fun(r :: River) -> ???:
  cases (River) r:
    | merge(width, left, right) =>
      ... width ...
      ... river-fun(left) ...
      ... river-fun(right) ...
    | stream(flow) => ... flow ...
  end
end 
|#

fun total-flow(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => total-flow(left) + total-flow(right)
    | stream(flow) => flow
  end
where:
  total-flow(stream-a) is 5
  total-flow(main-river) is 16
end

fun count-merges(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => 1 + count-merges(left) + count-merges(right)
    | stream(flow) => 0
  end
where:
  count-merges(stream-a) is 0
  count-merges(main-river) is 2
end
