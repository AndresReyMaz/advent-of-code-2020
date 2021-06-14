
proc readInput(): seq[string] =
  var input: seq[string]
  while true:
    try:
      let s = readLine(stdin)
      input.add(s)
    except IOError:
        break
  return input

proc countTrees(area: seq[string], down: int, right: int): int =
  var coordX = 0
  var coordY = 0
  var trees = 0
  while true:
    if coordX >= len(area):
      break
    if area[coordX][coordY] == '#':
      trees += 1
    coordX += down
    coordY = (coordY + right) mod len(area[0])
  return trees

proc part1(area: seq[string]): int =
  return countTrees(area, 1, 3)

proc part2(area: seq[string]): int =
  var ans = 1
  let x = [[1,1],[1,3],[1,5],[1,7],[2,1]]
  for pair in x:
    ans *= countTrees(area, pair[0], pair[1])
  return ans

let input = readInput()
echo("Part 1: ", part1(input))
echo("Part 2: ", part2(input))
