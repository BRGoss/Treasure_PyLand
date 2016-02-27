#POTENTIAL INTERVIEW QUESTION
#
#DESCRIPTION:  Check if a string's character are in the 
#              same order in another string
#CONTRACT:     Define a function called same_order that 
#              that accepts two inputs. The first is the
#              string of characters you are looking for.
#              The second input is the string you will
#              look through to find the characters of the
#              first input.
#              The output should be True if it is there,
#              or False if it isn't.
#Example: Input 1 = 'NAGARRO' Input 2 = 'NSDAFRGTHAGYREWRNH0'
#          Output = 'True'

def same_order(s):
	isTrue='False'
	compString='NAGARRO'
	i=0
	j=0
	while (isTrue==0 and i<len(s)):
		if(compString[j]==s[i]):
			j+=1
		if(j==len(compString)):
			isTrue='True'
		i+=1
	return isTrue

