use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data Pack:
  | empty-pack
  | item(name :: String, power :: Number, rest :: Pack)
end

data Dungeon:
  | dead-end
  | treasure(coins :: Number)
  | monster(strength :: Number, beyond :: Dungeon)
  | fork(left :: Dungeon, right :: Dungeon)
end

hero-pack = item("sword", 5, item("shield", 3, item("lantern", 1, empty-pack)))

cave =
  fork(
    monster(4, fork(treasure(50), dead-end)),
    fork(treasure(10), monster(12, treasure(200))))

fun pack-power(p :: Pack) -> Number:
  doc: "returns the total power of the packs items"
  cases(Pack) p:
    | empty-pack => 0
    | item(name, power, rest) => 
      power + pack-power(rest)
  end
where:
  pack-power(empty-pack) is 0
  pack-power(item("stick", 1, empty-pack)) is 1
  pack-power(hero-pack) is 9
end

fun all-coins(d :: Dungeon) -> Number:
  doc: "returns the total coins."
  cases(Dungeon) d:
    | dead-end => 0
    | treasure(coins) => coins
    | monster(strength, beyond) => all-coins(beyond)
    | fork(left, right) => all-coins(left) + all-coins(right)
  end
where:
  all-coins(dead-end) is 0
  all-coins(treasure(10)) is 10
  all-coins(monster(3, treasure(7))) is 7
  all-coins(cave) is 260
end

fun reachable-coins(d :: Dungeon, hero-power :: Number) -> Number:
  doc: "returns the total coins that in the treasures that hero can reach"
  cases(Dungeon) d:
    | dead-end => 0
    | treasure(coins) => coins
    | monster(strength, beyond) => 
      if hero-power >= strength:
        reachable-coins(beyond, hero-power)
      else:
        0
      end
    | fork(left, right) => reachable-coins(left, hero-power) + reachable-coins(right, hero-power)
  end
where:
  reachable-coins(treasure(5), 0) is 5
  reachable-coins(cave, 3) is 10
  reachable-coins(cave, 9) is 60
  reachable-coins(cave, 20) is 260
end

fun left-behind(d :: Dungeon, p :: Pack) -> Number:
  doc: "returns how many coins a hero carrying that pack can't reach."
  all-coins(d) - reachable-coins(d, pack-power(p))
where:
  left-behind(cave, hero-pack) is 200
  left-behind(cave, empty-pack) is 250
  left-behind(cave, item("dragon spear", 15, empty-pack)) is 0
end

fun best-trip(d :: Dungeon, hero-power :: Number) -> Number:
  doc: "returns the most coins that hero can collect in one trip."
  cases(Dungeon) d:
    | dead-end => 0
    | treasure(coins) => coins
    | monster(strength, beyond) => 
      if hero-power >= strength:
        best-trip(beyond, hero-power)
      else:
        0
      end
    | fork(left, right) =>
      if best-trip(left, hero-power) > best-trip(right, hero-power):
        best-trip(left, hero-power)
      else:
        best-trip(right, hero-power)
      end
  end
where:
  best-trip(cave, 3) is 10
  best-trip(cave, 9) is 50
  best-trip(cave, 20) is 200
end