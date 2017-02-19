def odd(start, end):
    for i in range(start, end):
        if(i % 2 == 1):
            print(i)


def mult(div, start, end):
    for i in range(start, end):
    # if requirement is end-inclusive, then range(start, end+1)
        if(i % div == 0):
            print(i)

def sumList(mylist):
    sum = 0;
    for i in mylist:
        sum += i
    return sum

def average(mylist):
    return float(sumList(mylist))/len(mylist)

print "Odd 1 to 1000: "
odd(1,1000)
print "Multiples of 5 from 5 to 10000000 (not end-inclusive)"
mult(5, 5, 1000000)
a = [1,2,5,10,255,3]
print "Sum of list ", a, "=", sumList(a)
print "Average of list ", a, "=", average(a)
