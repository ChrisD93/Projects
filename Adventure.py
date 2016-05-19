#Explorers Story
#Chris Draper
intGold = 750

print "Welcome to Lost Fortune"
print "Please enter the following for your personalized adventure: \n"
#inputs
strLeaderName = raw_input("Enter the name of the quest leader: ")
intNumberOfExplorers = int(raw_input("Enter the number of explorers: "))
intNumberLost = int(raw_input("Enter number of explorers lost in battle: "))

#Calculations
intSurvivors = intNumberOfExplorers - intNumberLost
intLeaderGold = intGold % (intSurvivors + 1)

#output
#print "Welcome to Lost Fortune"
#print "Please enter the following for your personalized adventure:"

print "\nThe brave", strLeaderName, "led", intNumberOfExplorers, "on a quest for gold."
print "The group fought a band of ogres and lost", intNumberLost, "members."
print "Only", intSurvivors, "survived."
print "The party was about to give up when they stumbled upon the"
print "burried fortune of", intGold, "gold pieces.  They split the loot and"
print strLeaderName, "kept the extra", intLeaderGold, "gold pieces"
raw_input("\n\nPress Enter to Exit")
