#POTENTIAL INTERVIEW QUESTION
#
#DESCRIPTION:  Accept first 30 characters of a string
#CONTRACT:     Define a function called accept_thirty
#              that accepts a string as input. The output
#              should be a string that contains the first
#              30 characters of the input string without
#              splitting words. Note that this means that
#              the output could be less than 30 characters
#              long
#Example: Input = 'A long long time ago this was a better time, at least for me' 
#         Output = 'A long long time ago this was'

def accept_thirty(sentence):
	words=string.split(sentence,' ')
	theString=''
	count=0
	i=0
	while (count < 30):
		count=count+len(words[i])+1
		if (count <= 30):
			theString=theString+words[i]
			if((count+len(words[i+1])+1) <= 30):
				theString=theString+' '
		i=i+1
	print theString
	return

