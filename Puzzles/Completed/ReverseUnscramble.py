#DESCRIPTION:  Reverse and decode
#CONTRACT:     Define a function that takes in 3 inputs.
#              The first input is the string to decode.
#              The second input is the string to split 
#              The first input after reversing.
#              The third input is an array of numbers
#              that helps decode the list of strings
#              after splitting. The number 36 as the 
#              first element of the array means that
#              the third and sixth element of the 
#              list of strings after splitting
#              should be concatenated, or put together.
#              The output shoud be the decoded first input
#              after reversing, splitting on second input,
#              and decoded using the third input.     
#EXAMPLE: Input 1 = 'seevacytevacnoJevacnoM'
#         Input 2 = 'cave' Input 3 = [13,24] 
#         Output = 'Monty Jones'
SOLUTION:  
def reverseScramble(toDecode,splitString,decoder):
	toDecode=toDecode[::-1]
	splitList=string.split(toDecode,splitString)
	for i in range(len(decoder)):
		miniArray=[int(j) for j in str(decoder[i])]
		for k in range(len(miniArray)):
			miniArray[k]=splitList[miniArray[k]-1]
		decoder[i]=''.join(miniArray)
	answer=' '.join(decoder)
	return answer
