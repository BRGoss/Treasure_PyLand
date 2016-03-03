#DESCRIPTION:  Title case a name
#ALGORITHM:    Define a function called titleCase that
#              takes a string as its only input. The output
#              should be the input with the first letter of
#              each word capitalized and all other letters
#              lowercased.
#EXAMPLE: Input = 'tREaSurE iSlAnd' Output = 'Treasure Island'
#SOLUTION:  
def titleCase(theString):
	answer = theString.title()
	return answer
