DESCRIPTION:  Get name of explorer
ALGORITHM:    Reverse the string, 
              split on a given string,
              then join the strings in 
              the correct order, given
              by the array. All numbers
              are 1 digit numbers, so
              36 means that the third
              and sixth string in the 
              list of split strings go
              together to form one word
EXAMPLE: split string = 'cave' array = [13,24]
         Input = 'seevacytevacnoJevacnoM' 
         Output = 'Monty Jones'
SOLUTION:  
def reverseScramble(s):
	aString='cave'
	array=[13,24]
	s=s[::-1]
	splitList=string.split(s,aString)
	for i in range(len(array)):
		miniArray=[int(j) for j in str(array[i])]
		for k in range(len(miniArray)):
			miniArray[k]=splitList[miniArray[k]-1]
		array[i]=''.join(miniArray)
	print ' '.join(array)
	return
