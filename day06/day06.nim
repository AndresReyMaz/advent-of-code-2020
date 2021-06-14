import sequtils, sets, strutils

proc parseInput(input: seq[string]): seq[seq[string]] =
  var forms: seq[seq[string]]
  var form: seq[string]
  for line in input:
    if line == "":
      forms.add(form)
      form = @[]
      continue
    form.add(line)
  forms.add(form)
  return forms

proc countUnique(form: seq[string]): int =
  var letters: sets.HashSet[char]
  for ans in form:
    for c in strip(ans):
      letters.incl(c)
  return len(letters)

proc countAll(form: seq[string]): int =
  var letters: sets.HashSet[char]
  for i in countup(0, len(form)-1):
    if i == 0:
      for c in strip(form[i]):
        letters.incl(c)
      continue
    var ansLetters: sets.HashSet[char]
    for c in strip(form[i]):
      ansLetters.incl(c)
    letters = intersection(letters, ansLetters)
  return len(letters)

proc part1(forms: seq[seq[string]]): int =
  var ans = 0
  for form in forms:
    ans += countUnique(form)
  return ans

proc part2(forms: seq[seq[string]]): int =
  var ans = 0
  for form in forms:
    ans += countAll(form)
  return ans

let input = parseInput(toSeq("./day06.txt".lines))
echo("Part 1: ", part1(input))
echo("Part 2: ", part2(input))
