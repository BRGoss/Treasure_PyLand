#DESCRIPTION:  Find treasure in string
#ALGORITHM:    Find the substring 'treasure' in
#              the provided string. Store the
#              lowest index in a variable, then
#              print the substring
#EXAMPLE: Input = 'abctreasuredef' Output = 'treasure'
#SOLUTION:  
def findTreasure(s):
        toFind='treasure'
	index=string.find(s,toFind)
	print s[index:index+len(toFind)]
	return
        

