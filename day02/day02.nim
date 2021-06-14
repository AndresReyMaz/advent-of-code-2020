import strutils
type
  Entry = tuple
    policyMin: int
    policyMax: int
    policyLetter: char
    password: string

proc readInput: seq[string] =
  var input: seq[string]
  while true:
    try:
      let s = readLine(stdin)
      input.add(s)
    except IOError:
        break
  return input

proc parseInput(input: seq[string]): seq[Entry] =
  var entries: seq[Entry]
  for line in input:
    let splitLine = line.split(' ')
    let minMax = splitLine[0].split('-')
    let min = minMax[0].parseInt()
    let max = minMax[1].parseInt()
    let letter = splitLine[1][0]
    let password = splitLine[2]
    entries.add((policyMin: min, policyMax: max, policyLetter: letter, password: password))
  return entries

proc part1(entries: seq[Entry]): int =
  var ans = 0
  for entry in entries:
    let times = entry.password.count(entry.policyLetter)
    if times >= entry.policyMin and times <= entry.policyMax:
      ans += 1
  return ans

proc part2(entries: seq[Entry]): int = 
  var ans = 0
  for entry in entries:
    if (entry.password[entry.policyMin-1] == entry.policyLetter) xor (
      entry.password[entry.policyMax-1] == entry.policyLetter):
      ans += 1
  return ans

let entries = parseInput(readInput())
echo("Part 1: ", part1(entries))
echo("Part 2: ", part2(entries))