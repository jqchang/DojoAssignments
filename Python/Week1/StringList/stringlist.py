monkey = "If monkeys like bananas, then I must be a monkey!"

def findAll(main, sub):
    i = 0
    while i != -1:
        i = main.find(sub, i, len(main))
        print i
        if i != -1:
            i += 1

findAll(monkey, "monkey")
alligator = monkey.replace("monkey", "alligator")
print alligator

def minmax(mylist):
    print "Min:", min(mylist)
    print "Max:", max(mylist)

minmax([2,54,-2,7,12,98])

def firstlast(mylist):
    newlist = []
    newlist.append(mylist[0])
    newlist.append(mylist[len(mylist)-1])
    return newlist

print firstlast(["hello",2,54,-2,7,12,98,"world"])


x = [19,2,54,-2,7,12,98,32,10,-3,6]
def newlist(mylist):
    neglist = []
    mylist.sort()
    while mylist[0] < 0:
        neglist.append(mylist.pop(0))
    mylist.insert(0,neglist)
    print(mylist)
newlist(x)
