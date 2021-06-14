import strutils

proc readInput: seq[string] =
  var input: seq[string]
  while true:
    try:
      let s = readLine(stdin)
      input.add(s)
    except IOError:
        break
  return input

proc parseInput(input: seq[string]): seq[seq[string]] =
  var passports: seq[seq[string]]
  var curPassport: seq[string]
  for line in input:
    if line == "":
      var passport: seq[string]
      passport.deepCopy(curPassport)
      passports.add(passport)
      curPassport = @[]
    else:
      var splitLine = line.split(' ')
      curPassport &= splitLine
  if len(curPassport) > 0:
    passports.add(curPassport)
  return passports
    
proc part1(passports: seq[seq[string]]): int =
  var valid = 0
  for passport in passports:
    if len(passport) < 7:
      continue
    elif len(passport) == 7:
      var missingCid = true
      for field in passport:
        if field.startsWith("cid"):
          missingCid = false
          break
      if not missingCid:
        continue
    valid += 1
  return valid


let passports = parseInput(readInput())
echo("Part 1: ", part1(passports))