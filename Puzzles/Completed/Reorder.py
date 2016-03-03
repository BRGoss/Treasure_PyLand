#DESCRIPTION:  Get address from string
#CONTRACT:     Define a function called
#              getAddress that accepts 
#              3 inputs. The first input
#              is the string that needs 
#              to be decoded. The second
#              input is the string to split
#              the first input. The third
#              input is an array of numbers
#              that tells you the order. For
#              example, a 3 as the first element
#              means that the third element of the
#              list of strings after the split
#              is the first string in the solution.
#              The output should be the first input
#              decoded.
#EXAMPLE: Input 1 = '79016xCanyonxAvexTXx4thx2501'
#         Input 2 = 'x' Input 3 = [6,5,3,2,4,1] 
#         Output = '2501 4th Ave Canyon TX 79016'
#SOLUTION:  
def getAddress(toDecode,split,decoder):
	theList=string.split(toDecode,split)
	for index in range(len(decoder)):
		decoder[index]=theList[decoder[index]-1]
	answer=' '.join(decoder)
	return answer
