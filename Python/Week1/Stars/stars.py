# Python Assignment: Stars
# Partner: Dan Baron

def stars(arr):
    for i in arr:
        if type(i) == int:
            star_str = ""
            for j in range(i):
                star_str += '*'
            print star_str
        elif type(i) == str:
            star_str = ""
            for k in range(len(i)):
                star_str += i.lower()[0]
            print star_str

# stars([4, 6, 1, 3, 5, 7, 25])
stars([4, "Tom", 1, "Michael", 5, 7, "Jimmy Smith"])
