use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun is-long-enough(s :: String) -> Boolean:
  doc:"checks if the string has at least 5 characters"
  string-length(s) >= 5
where:
  is-long-enough("ada") is false
  is-long-enough("hello") is true
end

fun has-no-space(s :: String) -> Boolean:
  doc: "checks the string to see if there is a space"
  if string-contains(s, " "):
    false
  else:
    true
  end
where:
  has-no-space("hello") is true
  has-no-space("a b c") is false
end

fun is-available(s :: String) -> Boolean:
  doc:"checks if the string has no space, is long enough, and isn't admin or root"
  (is-long-enough(s)) and (has-no-space(s)) and (not(string-to-lower(s) == "admin")) and (not(string-to-lower(s) == "root"))
where:
  is-available("hello") is true
  is-available("admin") is false
  is-available("root") is false
  is-available("a b c") is false
end

fun status(s :: String) -> String:
  if is-available(s):
    "ok"
  else if not(is-long-enough(s)):
    "too short"
  else if not(has-no-space(s)):
    "no spaces"
  else:
    "taken"
  end
where:
  status("hello") is "ok"
  status("ad m") is "too short"
  status("hello there") is "no spaces"
  status("admin") is "taken"
end

fun status-chip(s :: String) -> Image:
  doc:"returns a small rectangle with the status text"
  if status(s) == "ok":
    overlay(text(s, 24, "olive"), rectangle(60, 50, "outline", "green"))
  else:
    overlay(text(s, 24, "olive"), rectangle(60, 50, "outline", "red"))
  end
end