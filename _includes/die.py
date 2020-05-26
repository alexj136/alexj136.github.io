import random

targetNumber = 6

def throwDie():
    print("rolling...")
    rand = random.randint(1, 6)
    print(str(rand) + "!")
    return rand

# roll a 6-sided die until the given target number comes up.
# Return the total number of throws.
def rollDieUntilTarget(target):
    print("Rolling until a " + str(target) + " comes up...")
    currentResult = throwDie()
    throws = 1
    while currentResult is not target:
        currentResult = throwDie()
        throws += 1
    return throws

totalThrows = rollDieUntilTarget(targetNumber)
print("Took " + str(totalThrows) + " throws to roll a " \
    + str(targetNumber) + ".")
