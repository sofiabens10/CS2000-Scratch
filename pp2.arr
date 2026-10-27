use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


import lists as L 
import math as M

fun change(s :: String) -> Number:
  doc: "takes an event and returns how much it changes the number of people in the room."
  if s == "in":
    1
  else if s == "out":
    -1
  else:
    4
  end
where:
  change("in") is 1
  change("out") is -1
  change("group") is 4
end

fun changes(l :: List<String>) -> List<Number>:
  doc: "returns a list of the change from each event"
  L.map(change, l)
where:
  changes([list: "in", "out", "group"]) is [list: 1, -1, 4]
  changes([list: ]) is [list: ]
end

fun peak-crowd(l :: List<String>) -> Number block:
  doc: "returns the peak crowd"
  var result = 0
  var total = 0
  for each(s from l) block:
    total := total + change(s) 
    when total > result:
      result := total
    end
  end
  result
where:
  peak-crowd([list: ]) is 0
  peak-crowd([list: "in"]) is 1
  peak-crowd([list: "in", "group", "out", "out", "out"]) is 5
end

fun night-report(t :: Table) -> String:
  doc: "returns a string that contains the peak crowd and how many people were still left in the room"
  l1 = get-column(t, "event") 
  "Peak crowd: " + num-to-string(peak-crowd(l1)) + ", still there at the end: " + num-to-string(M.sum(changes(l1)) )
where:
  friday = table: time :: String, event :: String
  row: "7:00", "group"
  row: "7:05", "in"
  row: "7:30", "out"
  row: "7:45", "group"
  row: "8:20", "out"
  row: "8:40", "out"
  row: "9:10", "out"
end
  night-report(friday) is "Peak crowd: 8, still there at the end: 5"
end

fun door-log(l :: List<String>) -> Image block:
  doc: "returns an image: one square per event, side by side, arrivals should be green and departures should be red."
  var result = empty-image
  for each(s from l):
    if s == "in":
      result := beside(result, square(40, "solid", "green"))
    else if s == "out":
      result := beside(result, square(40, "solid", "red"))
    else:
      result := beside(result, square(40, "solid", "green"))
    end
  end
  result
end