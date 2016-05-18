
puzzle = Hash.new

puzzle["name1"] = "Title Case"

puzzle["desc1"] = "Transform a string to be capitalized like a title"

puzzle["con1"] = <<CONTRACT
Define a function called titleCase that takes a string as its 
only parameter.  The output should be the parameter with the first 
letter of each word capitalized and all other letters 
lowercased.
CONTRACT

puzzle["in1"]  = "\"tREaSurE isLAnD\""

puzzle["out1"] = "Treasure Island"

puzzle["sol1"] = <<SOLUTION
def titleCase(theString):
	return theString.title()
SOLUTION



puzzle["name2"] = "Replace"

puzzle["desc2"] = "Replaces a character in a string with something else"

puzzle["con2"] = <<CONTRACT
Define a function called replace that accepts three parameters. 
The first parameter is the string that will have its letters replaced 
by the function.  The second parameter will be the string 
that will be replaced.  The third parameter will be the string 
that will replace all instances of the second parameter in the 
first parameter.  The output should be the first parameter with all 
instances of the second parameter replaced with the third parameter.
CONTRACT

puzzle["in2"]  = "\"abcdefg\", \"a\", \"bc\""

puzzle["out2"] = "bcbcdefg"

puzzle["sol2"] = <<SOLUTION
def replace(string, toReplace, replaceWith):
	rep = string.replace(toReplace, replaceWith) 
	return rep
SOLUTION



puzzle["name3"] = "Remove Wrong Words"

puzzle["desc3"] = <<DESCRIPTION
You have a string of words, but extra words have been 
included that are not necessary.  Each of the unnecessary 
words contains a letter that is not included in the needed 
words.  Use this knowledge to remove the unnecessary words.
DESCRIPTION

puzzle["con3"] = <<CONTRACT
Define a function called remove_wrong_words that accepts two 
parameters.  The first is the string that contains all the words.  
The second parameter is the letter that all the wrong words have.  
The output should be the first parameter with all the wrong words 
removed.
CONTRACT

puzzle["in3"]  = "\"Turn zero left zoom jazz at the zoo old booze tree\", \"z\""

puzzle["out3"] = "Turn left at the old tree"

puzzle["sol3"] = <<SOLUTION
def remove_wrong_words(words, doNotInclude):
	searchList = words.split()
	keepList = list()
	for index in range(len(searchList)):
		if(doNotInclude not in searchList[index]):
			keepList.append(searchList[index])
	answer = ' '.join(keepList)
	return answer
SOLUTION



puzzle["name4"] = "Accept 30 Characters"

puzzle["desc4"] = "Accept the first 30 characters of a string"

puzzle["con4"] = <<CONTRACT
Define a function called acceptThirty that takes a 
string as its parameter.  The output should be a string that 
contains the first 30 characters without splitting any 
words.  Note that this means that the output could be 
less than 30 characters long.
CONTRACT

puzzle["in4"] = "\"A long long time ago this was a better time, at least for me\""

puzzle["out4"] = "A long long time ago this was"

puzzle["sol4"] = <<SOLUTION
def accept_thirty(sentence):
	words = sentence.split(' ')
	theString = ''
	count = 0
	i = 0
	while (count < 30):
		count = count + len(words[i]) + 1
		if (count <= 30):
			theString = theString + words[i]
			if((count + len(words[i + 1]) + 1) <= 30):
				theString = theString + ' '
		i = i + 1
	return theString
SOLUTION



puzzle["name5"] = "Find Substring"

puzzle["desc5"] = "Find a substring"

puzzle["con5"] = <<CONTRACT
Define a function called find that takes two parameters.  
The first parameter is the string that the function will look 
in.  The second parameter will be the string that the function 
is looking for.  The output should be the substring in the 
first parameter that is the second parameter.
CONTRACT

puzzle["in5"] = "\"abctreasuredef\", \"treasure\""

puzzle["out5"] = "treasure"

puzzle["sol5"] = <<SOLUTION
def find(toLookIn, toFind):
	index = toLookIn.find(toFind)
	return toLookIn[index:index + len(toFind)]
SOLUTION



puzzle["name6"] = "Reorder"

puzzle["desc6"] = "Get an address from a string"

puzzle["con6"] = <<CONTRACT
Define a function called getLocation that accepts three 
parameters.  The first parameter is the string that needs to be 
decoded.  The second parameter is the string to split the 
first parameter.  The third parameter is an array of numbers that 
tells you the order to reorder the words into.  For example 
a 3 as the first element of the array means that the third 'word' in 
the first parameter is the first 'word' in the solution.  The 
output should be the decoded first parameter.
CONTRACT

puzzle["in6"] = "\"79016xCanyonxAvexTXx4thx2501\", \"x\", [6, 5, 3, 2, 4, 1]"

puzzle["out6"] = "2501 4th Ave Canyon TX 79016"

puzzle["sol6"] = <<SOLUTION
def getLocation(toDecode, split, decoder):
	theList = toDecode.split(split)
	for index in range(len(decoder)):
		decoder[index] = theList[decoder[index] - 1]
	answer = ' '.join(decoder)
	return answer
SOLUTION



puzzle["name7"] = "Reverse and Unscramble"

puzzle["desc7"] = "Reverse and Decode"

puzzle["con7"] = <<CONTRACT
Define a function that takes in three inputs.  
The first input is the string to decode.  The 
second is the string to split the first string 
with.  The third is an array of numbers that 
helps decode the first string.  You will reverse 
the first string, split it, then unscramble it.  
For example on the third input, if the first 
element is 36, this means that the third and 
sixth parts of the first string should be 
concatenated together.  The words in the output 
string will need to have spaces between them.
CONTRACT

puzzle["in7"] = "\"seevacytevacnoJevacnoM\", \"cave\", [13, 24]"

puzzle["out7"] = "Monty Jones"

puzzle["sol7"] = <<SOLUTION
def reverseScramble(toDecode, splitString, decoder):
	toDecode = toDecode[::-1]
	splitList = toDecode.split(splitString)
	for i in range(len(decoder)):
		miniArray = [int(j) for j in str(decoder[i])]
		for k in range(len(miniArray)):
			miniArray[k] = splitList[miniArray[k] -1]
		decoder[i] = ''.join(miniArray)
	answer = ' '.join(decoder)
	return answer  
SOLUTION



puzzle["name8"] = "Replace ASCII"

puzzle["desc8"] = "Decode a string of numbers and replace with their ASCII counterparts"

puzzle["con8"] = <<CONTRACT
Define a function called replace_ascii that accepts a string as its only input.  This 
will be a string of numbers separated by spaces.  Your output should be a string
in which each number has been changed to it's ASCII character that corresponds
to that number.
CONTRACT

puzzle["in8"] = "\"97 98 99 100 101\""

puzzle["out8"] = "a b c d e"

puzzle["sol8"] = <<SOLUTION 
def replace_ascii(inputString):
	theNumbers = inputString.split()
	for index in range(len(theNumbers)):
		theNumbers[index] = chr((int)(theNumbers[index]))
	answer = ' '.join(theNumbers)
	return answer
SOLUTION



puzzle["name9"] = "Reverse Words"

puzzle["desc9"] = "Reverse the words in a sentence"

puzzle["con9"] = <<CONTRACT
Define a function called reverse_words that takes a string as its input.  
The output should be a string in which the words from the input string 
are now in reverse order.
CONTRACT

puzzle["in9"] = "\"A long long time ago\""

puzzle["out9"] = "ago time long long A"

puzzle["sol9"] = <<SOLUTION
def reverse_words(sentence):
	words = ' '.join(sentence.split(' ')[::-1])
	return words
SOLUTION



puzzle["name10"] = "Find Unique"

puzzle["desc10"] = "Find the words with all unique letters"

puzzle["con10"] = <<CONTRACT
Define a function that takes one string.  The function will find all 
unique words in the string.  Each word is separated by a single 
space.  It will return a string of all the unique words separated 
spaces.  If there are no unique words return an empty string.  
Note that the function should be case insensitive, 
i.e. \'T\' == \'t\'
***Note that unique words in this context means a word with all 
unique letters, no duplicates
CONTRACT

puzzle["in10"] = "\"Turn immediately right at all the tree stump\""

puzzle["out10"] = "Turn right at the stump"

puzzle["sol10"] = <<SOLUTION
def findUniqueWords(theString):
	theList = theString.split(' ')
	theAnswer = ''
	isUnique = True
	for word in theList:
		theWord = word.lower()
		theSet = set(theWord)
		if len(theSet) != len(theWord):
			isUnique = False
		if isUnique:
			theAnswer += word + ' '
		isUnique = True
	if theAnswer == '':
		theAnswer = ''
	else:
		theAnswer = theAnswer[:len(theAnswer) - 1]
	return theAnswer
SOLUTION



Puzzle.delete_all

1.upto(10) do |counter|
# (1..7).each do |counter|

	puzz = Puzzle.create!(name: puzzle["name#{counter}"],
						  description: puzzle["desc#{counter}"],
						  contract: puzzle["con#{counter}"],
						  solution: puzzle["sol#{counter}"])

	puzz.parameters.create!(input: puzzle["in#{counter}"],
							output: puzzle["out#{counter}"])
end
