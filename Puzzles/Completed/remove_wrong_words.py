#DESCRIPTION:  You have a string of words, but extra words have been included that
#              are not necessary.  Each of the unnecessary words contains a letter
#              that is not included in the needed words.  For example "Turn zero
#              left zoom jazz at the zoo old booze tree", all the unneeded words have
#              the letter z in them.

#CONTRACT:     Define a function called remove_wrong_words that accepts two inputs.
#              The first is the string that contains all the words. The second
#              input is the leter that all the wrong words have. The output should
#              be the first input with all the wrong words removed.

#EXAMPLE:      Input 1 = 'Turn zero left zoom jazz at the zoo old booze tree'
#              Input 2 = 'z'
#              Output = 'Turn left at the old tree'


def remove_wrong_words(words,doNotInclude)
	searchList=words.split()
	keepList=list()
	for index in range(len(searchList)):
		if(doNotInclude not in searchList[index]):
			keepList.append(searchList[index])
	answer = ''.join(keepList)
	return answer

