use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("voterdata.csv", default-options)
end

fun blank-to-indep(s :: String) -> String:
  doc: "replace empty with Independent"
  if s == "":
    "Independent"
  else:
    s
  end
where:
  blank-to-indep("") is "Independent"
  blank-to-indep("blah") is "blah"
end 

voter-indep = transform-column(voter-data, "Party", blank-to-indep)

fun normalize-phone(phone :: String):
  doc: "normalizes phone numbers without using dashes, dots, or parantheses"
  a = string-replace(phone, "-", "")
  b = string-replace(a, "(", "")
  c = string-replace(b, ")", "")
  d = string-replace(c, " ", "")
  e = string-replace(d, ".", "")
  e
where:
  normalize-phone("555.987.6543") is "5559876543"
  normalize-phone("0-1-2-3-3") is "01233"
end 
  voter-phone = transform-column(voter-data, "Phone", normalize-phone)

#| To transform the LastVoted Column to a format that looks like "Oct 10 2022":
   start by figuring out which number is which month
   find a way to bring the month to the front 
   get rid of any dashes or slashes
   reorder the date so that the date comes before the year