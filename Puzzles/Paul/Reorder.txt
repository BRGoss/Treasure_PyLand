DESCRIPTION:  Get address from string
ALGORITHM:    Split on a given string,
              then join the strings in 
              the correct order, given
              by the array
EXAMPLE: split string = 'x' array = [6,5,3,2,4,1]
         Input = '79016xCanyonxAvexTxx4thx2501' 
         Output = '2501 4th Ave Canyon TX 79016'
SOLUTION:  
def getAddress(s):
	theList=string.split(s,'x')
	decode=[6,5,3,2,4,1]
	for index in range(len(decode)):
		decode[index]=theList[decode[index]-1]
	print ' '.join(decode)
	return
