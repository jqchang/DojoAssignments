def push_front(arr, x):
    arr.append(x)
    for i in range(len(arr)-1):
        arr[len(arr)-i-1],arr[len(arr)-i-2] = arr[len(arr)-i-2],arr[len(arr)-i-1]
    return arr

ar = [1,3,4,5,6]
push_front(ar, 12)
print ar
push_front(ar, 17)
print ar
