import sets
import strutils
var YEAR = 2020
var ls: sets.HashSet[int]
while true:
    try:
        let s = readLine(stdin)
        let i = strutils.parseInt(s)
        echo(i)
        if ls.contains(YEAR-i):
            echo((YEAR - i) * i)
            break
        ls.incl(i)
    except IOError:
        break