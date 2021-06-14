import algorithm
import sets
import strutils
import system
var YEAR = 2020
var ls: sets.HashSet[int]
var mylist: seq[int]
mylist = @[]
while true:
    try:
        let s = readLine(stdin)
        let i = strutils.parseInt(s)
        mylist.add(i)
        ls.incl(i)
    except IOError:
        break
algorithm.sort(mylist)
for i in 0 ..< len(mylist)-1:
    for j in i+1 ..< len(mylist):
        if ls.contains(YEAR-mylist[i]-mylist[j]):
            echo((YEAR-mylist[i]-mylist[j])*mylist[i]*mylist[j])
            system.quit()