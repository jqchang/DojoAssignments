def oddeven():
    for i in range(1,2001):
        oddstr = "odd"
        if i % 2 == 0:
            oddstr = "even"
        print "Number is " +str(i) +". This is an " + oddstr + " number."

oddeven()

def multiply(mylist, num):
    newlist = []
    for i in mylist:
        newlist.append(i * num)
    return newlist

a = [2,4,10,16]
b = multiply(a, 5)
print b

def layered_multiples(arr):
    new_array = []
    for i in arr:
        j = 0
        sub_arr = []
        while j < i:
            sub_arr.append(1)
            j+=1
        new_array.append(sub_arr)
    return new_array

x = layered_multiples(multiply([2,4,5],3))
print x
