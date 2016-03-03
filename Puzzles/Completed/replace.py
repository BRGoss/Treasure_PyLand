#DESCRIPTION: This function replaces a character in a string with something else
#CONTRACT:    Define a function  called replace that accepts three inputs.
#             The first input is the string that the function will be replacing
#             letters in. The second input will be the string that will be 
#             replaced. The third input will be the string that will replace
#             all instances of the second input in the first input.
#             The output should be the first input with all instances
#             of the second input replaced with the third input.

#NOTE:  May want to decide if should replace capital letters as well

#Example: Input 1 = 'abcdefg'
#         Input 2 = 'a' Input 3 = 'bc'
#         Output = 'bcbcdefg'

def replace(s,toReplace,replaceWith):
	rep = words.replace(toReplace, replaceWith)
#       rep = rep.replace('A','bc') to replace upper case
	return rep
