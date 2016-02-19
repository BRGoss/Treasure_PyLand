DESCRIPTION:  Get name of boat
ALGORITHM:    Split on a given string,
              then join the strings in 
              the correct order, given
              by the array. All numbers
              are 1 digit numbers, so
              36 means that the third
              and sixth string in the 
              list of split strings go
              together to form one word
EXAMPLE: split string = 'rek' array = [24,315]
         Input = 'norekUrekMinrekSSrekw' 
         Output = 'USS Minnow'
SOLUTION:  
def findBoat(s):
	aString='rek'
	array=[24,315]
	splitList=string.split(s,aString)
	for i in range(len(array)):
		miniArray=[int(j) for j in str(array[i])]
		for k in range(len(miniArray)):
			miniArray[k]=splitList[miniArray[k]-1]
		array[i]=''.join(miniArray)
	print ' '.join(array)
	return
