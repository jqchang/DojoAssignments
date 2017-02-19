import random

def cointoss():
    heads = 0
    tails = 0
    for i in range(5000):
        result = round(random.random())
        resultStr = ""
        if(result):
            heads += 1
            resultStr = "head"
        else:
            tails += 1
            resultStr = "tail"
        print "Attempt #" + str(i+1) + ": Throwing a coin... It's a " + resultStr + "! ... Got " + str(heads) + " head(s) so far and " + str(tails) + " tail(s) so far"



print "Starting the program..."
cointoss()
print "Ending the program, thank you!"
