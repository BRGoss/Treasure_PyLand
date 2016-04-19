
puzzle = Hash.new

puzzle["name1"] = "Title Case"

puzzle["desc1"] = "Transform a string to be capitalized like a title"

puzzle["con1"] = <<END
Define a function called titleCase that takes a string as its 
only input.  The output should be the input with the first 
letter of each word capitalized and all other letters 
lowercased.
END

puzzle["in1"]  = "\"tREaSurE isLAnD\""

puzzle["out1"] = "Treasure Island"

puzzle["sol1"] = "def titleCase(theString):\n" +
			 "\treturn theString.title()"

puzzle["name2"] = "Replace"

puzzle["desc2"] = "Replaces a character in a string with something else"

puzzle["con2"] = "Define a function called replace that accepts three inputs.  " +
			 "The first input is the string that the function will be " +
			 "replacing letters in.  The second input will be the string " +
			 "that will be replaced.  The third input will be the string " +
			 "that will replace all instances of the second input in the " +
			 "first input.  The output should be the first input with all " +
			 "instances of the second input replaced with the third input."

puzzle["in2"]  = "\"abcdefg\", \"a\", \"bc\""

puzzle["out2"] = "bcbcdefg"

puzzle["sol2"] = "def replace(string, toReplace, replaceWith):\n" +
			 "\trep = string.replace(toReplace, replaceWith)\n" +
			 "\treturn rep"

puzzle["name3"] = "Remove Wrong Words"

puzzle["desc3"] = "You have a string of words, but extra words have been " +
				 "included that are not necessary.  Each of the unnecessary " +
				 "words contains a letter that is not included in the needed " +
				 "words.  Use this knowledge to remove the unnecessary words"

puzzle["con3"] = "Define a function called remove_wrong_words that accepts two " +
			 "inputs.  The first is the string that contains all the words.  " +
			 "The second input is the letter that all the wrong words have.  " +
			 "The output should be the first input with all the wrong words " +
			 "removed."

puzzle["in3"]  = "\"Turn zero left zoom jazz at the zoo old booze tree\", \"z\""

puzzle["out3"] = "Turn left at the old tree"

puzzle["sol3"] = "def remove_wrong_words(words, doNotInclude):\n" +
				 "\tsearchList = words.split()\n" +
				 "\tkeepList = list()\n" +
				 "\tfor index in range(len(searchList)):\n" +
					 "\t\tif(doNotInclude not in searchList[index]):\n" +
						 "\t\t\tkeepList.append(searchList[index])\n" +
				 "\tanswer = ' '.join(keepList)\n" +
				 "\treturn answer"

puzzle["name4"] = "Accept 30 Characters"

puzzle["desc4"] = "Accept the first 30 characters of a string"

puzzle["con4"] = "Defin a function called accept_thirty that takes a " +
				"string as input.  The output should be a string that " +
				"contains the first 30 characters without splitting any " +
				"words.  Note that this means that the output could be " +
				"less than 30 characters long"

puzzle["in4"] = "\"A long long time ago this was a better time, at least for me\""

puzzle["out4"] = "A long long time ago this was"

puzzle["sol4"] = "def accept_thirty(sentence):\n" +
					 "\twords = sentence.split(' ')\n" +
					 "\ttheString = ''\n" +
					 "\tcount = 0\n" +
					 "\ti = 0\n" +
					 "\twhile (count < 30):\n" +
						 "\t\tcount = count + len(words[i]) + 1\n" +
						 "\t\tif (count <= 30):\n" +
							 "\t\t\ttheString = theString + words[i]\n" +
							 "\t\t\tif((count + len(words[i + 1]) + 1) <= 30):\n" +
								 "\t\t\t\ttheString = theString + ' '\n" +
						 "\t\ti = i + 1\n" +
					 "\treturn theString"

puzzle["name5"] = "Find Substring"

puzzle["desc5"] = "Find a substring"

puzzle["con5"] = "Define a function called find that takes two inputs.  " +
				"The first input is the strong that the function will look " +
				"in.  The second input will be the string that the function " +
				"is looking for.  The output should be the substring in the " +
				"first input that is the second input"

puzzle["in5"] = "\"abctreasuredef\""

puzzle["out5"] = "treasure"

puzzle["sol5"] = "def find(toLookIn, toFind]:\n" +
				 "\tindex = toLookIn.find(toFind)\n" +
				 "\treturn toLookIn[index:index + len(toFind)]\n"

puzzle["name6"] = "Reorder"

puzzle["desc6"] = "Get an address from a string"

puzzle["con6"] = "Define a function called getLocation that accepts three " +
				"inputs.  The first input is the string that needs to be " +
				"decoded.  The second input is the string to split the " +
				"first input.  The third input is an array of numbers that " +
				"tells you the order to reorder the words into.  For example " +
				"a 3 as the first element means that the third 'word' in " +
				"the first string is the first string in the solution.  The " +
				"output should be the decoded first string"

puzzle["in6"] = "\"79016xCanyonxAvexTXx4thx2501\", \"x\", [6, 5, 3, 2, 4, 1]"

puzzle["out6"] = "2501 4th Ave Canyon Tx 79016"

puzzle["sol6"] = "def getLocation(toDecode, split, decoder):\n" +
					 "\ttheList = toDecode.split(split)\n" +
					 "\tfor index in range(len(decoder)):\n" +
						 "\t\tdecoder[index] = theList[decoder[index - 1]\n" +
					 "\tanswer = ' '.join(decoder)\n" +
					 "\treturn answer"

puzzle["name7"] = "Reverse and Unscramble"

puzzle["desc7"] = "Reverse and Decode"

puzzle["con7"] = "Define a function that takes in three inputs.  " +
				 "The first input is the string to decode.  The " +
				 "second is the string to split the first string " +
				 "with.  The third is an array of numbers that " +
				 "helps decode the first string.  You will reverse " +
				 "the first string, split it, then unscramble it.  " +
				 "For example on the third input, if the first " +
				 "element is 36, this means that the third and " +
				 "sixth parts of the first string should be " +
				 "concatenated together.  The words in the output " +
				 "string will need to have spaces between them."

puzzle["in7"] = "\"seevacytevacnoJevacnoM\", \"cave\", [13, 24]"

puzzle["out7"] = "Monty Jones"

puzzle["sol7"] = "def reverseScramble(toDecode, splitString, decoder):\n" +
				 "\ttoDecode = toDecode[::-1]\n" +
				 "\tsplitList = toDecode.split(splitString)\n" +
				 "\tfor i in range(len(decoder)):\n" +
				 "\t\tminiArray = [int(j) for j in str(decoder[i])]\n" +
				 "\t\tfor k in range(len(miniArray)):\n" +
				 "\t\t\tminiArray[k] = splitList[miniArray[k] -1]\n" +
				 "\t\tdecoder[i] = ''.join(miniArray)\n" +
				 "\tanswer = ' '.join(decoder)\n" +
				 "\treturn answer"  

puzzle["name8"] = "Replace ASCII"

puzzle["desc8"] = "Decode a string of numbers and replace with their ASCII counterparts"

puzzle["con8"] = <<CONTRACT
Define a function called replace_ascii that accepts a string as its only input.  This 
will be a string of numbers separated by spaces.  Your output should be a string
in which each number has been changed to it's ASCII character that corresponds
to that number.
CONTRACT

puzzle["in8"] = "\"97 98 99 100 101\""

puzzle["out8"] = "abcde"

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



Puzzle.delete_all

1.upto(9) do |counter|
# (1..7).each do |counter|

	puzz = Puzzle.create!(name: puzzle["name#{counter}"],
						  description: puzzle["desc#{counter}"],
						  contract: puzzle["con#{counter}"],
						  solution: puzzle["sol#{counter}"])

	puzz.parameters.create!(input: puzzle["in#{counter}"],
							output: puzzle["out#{counter}"])
end
