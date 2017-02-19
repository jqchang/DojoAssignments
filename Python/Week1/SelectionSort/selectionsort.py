# track minimum value
# each loop, swap minimum value of that loop with the first value of the loop
    #start at outer loop counter, end at array end
    #if current value < minimum, set minimum = current value

def selectSort(arr):
    for i in range(len(arr)):
        minVal = arr[i]
        for j in range(i,len(arr))
            if arr[j]<minVal:
                minVal = arr[j]
