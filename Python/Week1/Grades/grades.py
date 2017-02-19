import random

def generateScores():
    scorelist = []
    for i in range(10):
        x = int(random.random()*40+60)
        gradeStr = ""
        if x < 70:
            gradestr = "D"
        elif x < 80:
            gradestr = "C"
        elif x < 90:
            gradestr = "B"
        else:
            gradestr = "A"
        print "Score: " + str(x) + "; Your grade is " + gradestr

print "Scores and Grades"
generateScores()
print "End of the program. Bye!"
