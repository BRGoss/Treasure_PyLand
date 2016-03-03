#DESCRIPTION:  Get name of boat
#ALGORITHM:    Define a function called findName that takes
#              three inputs. The first input would be the 
#              the string that needs to be decoded. The 
#              second input is the string that the first
#              input needs to be split on. The third
#              input is an array of numbers that helps decode
#              the list of strings after the split. For example,
#              the number 56 as the first element means that the 
#              first word is composed of the fifth and sixth strings
#              in the list of strings after the split.
#EXAMPLE: Input 1 = 'norekUrekMinrekSSrekw'
#         Input 2 = 'rek' Input 3 = [24,315] 
#         Output = 'USS Minnow'
#SOLUTION:  
def findName(toDecode,splitter,decoder):
	aString='rek'
	array=[24,315]
	splitList=string.split(toDecode,splitter)
	for i in range(len(decoder)):
		miniArray=[int(j) for j in str(decoder[i])]
		for k in range(len(miniArray)):
			miniArray[k]=splitList[miniArray[k]-1]
		decoder[i]=''.join(miniArray)
	answer = ' '.join(decoder)
	return answer
