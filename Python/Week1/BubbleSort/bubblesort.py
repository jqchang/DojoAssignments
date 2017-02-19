# test case [1,5,6,2,4,3]
# iterate loop
    # compare adjacent values
    # if left is greater, swap w/ right
    # each loop, greatest value will be 'bubbled' to the right

def bubbleSort(arr):
    for i in range(len(arr)):
        for j in range(len(arr)-i-1):
            if arr[j] > arr[j+1]:
                arr[j],arr[j+1] = arr[j+1],arr[j]
            print arr
        print "loop",i,"complete"

x = [1,5,6,2,4,3]
bubbleSort(x)
print x
