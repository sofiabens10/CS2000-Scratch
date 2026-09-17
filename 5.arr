use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


true
false

fun choose-hat(temp-in-F :: Number) -> String:
  doc: "determines appropriate headgear, above 80F sun hate, below 50F winter hat, below nothing"
  spy:
    temp-in-F,
    comparison: temp-in-F > 80
  end
  if temp-in-F >= 80:
    "sun hat"
  else if temp-in-F < 50: 
    "winter hat"
  else:
    "no hat"
  end
  
where: 
  choose-hat(50) is "no hat"
  choose-hat(85) is "sun hat"
  choose-hat(80) is "sun hat"
  choose-hat(73) is "no hat"
  choose-hat(45) is "winter hat"
end

fun add-glasses(outfit :: String) -> String:
  doc: "always adds glasses to your outfit"
  outfit + ", and glasses"
end

fun choose-outfit(temp :: Number) -> String:
  doc: "combines choose-hat and add-glasses to create an outfit"
  add-glasses(choose-hat(temp))
end