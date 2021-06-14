import sets
proc readInput: seq[string] =
  var input: seq[string]
  while true:
    try:
      let s = readLine(stdin)
      input.add(s)
    except IOError:
        break
  return input

proc isLower(c: char): bool =
  return c == 'F' or c == 'L'

proc decodeBinarySpacePartitioning(token: string, idx: int, lo: int, hi: int): int =
  if idx >= len(token):
    return lo
  var newLo = lo
  var newHi = hi
  if isLower(token[idx]):
    newHi = lo + int((hi - lo) / 2)
  else:
    newLo = hi - int((hi - lo) / 2)
  return decodeBinarySpacePartitioning(token, idx + 1, newLo, newHi)

proc getSeatID(pass: string): int =
  let row = decodeBinarySpacePartitioning(pass[0..6], 0, 0, 127)
  let col = decodeBinarySpacePartitioning(pass[7..9], 0, 0, 7)
  return row * 8 + col

proc part1(input: seq[string]): int =
  var maxID = 0
  for pass in input:
    maxID = max(maxID, getSeatID(pass))
  return maxID

proc part2(input: seq[string]): int =
  var seatIDs: sets.HashSet[int]
  for pass in input:
    seatIDs.incl(getSeatID(pass))
  var i = 0
  while i < 127 * 8 + 8:
    i += 1
    if seatIDs.contains(i-1) and seatIDs.contains(i+1) and not seatIDs.contains(i):
      return i
  return -1

let input = readInput()
echo("Part 1: ", part1(input))
echo("Part 2: ", part2(input))