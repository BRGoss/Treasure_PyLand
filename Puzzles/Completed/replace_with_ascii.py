#DESCRIPTION:  Replace a string of numbers with their ASCII character equivalent
#CONTRACT:     Define a function called replace_with_ascii that accepts a string
#              as its only input. The output should be the character that corresponds
#              to the number in the input in ASCII.
#EXAMPLE:      Input = '97 98 99 100 101'
#              Output = 'abcde'


def replace_with_ascii(inputString)
	theNumbers=inputString.split()
	for index in range(len(theNumbers)):
		theNumbers[index]=chr((int)(theNumbers[index]))
	answer=''.join(theNumbers)
	return answer
