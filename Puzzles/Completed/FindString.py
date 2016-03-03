#DESCRIPTION:  Find treasure in string
#CONTRACT:     Define a function called find that takes
#              two inputs. The first input is the string
#              that the function will look in. The second
#              input will be the string that the function
#              is looking for. The output should be the
#              substring in the first input that is the
#              the second input.
#EXAMPLE: Input = 'abctreasuredef' Output = 'treasure'
#SOLUTION:  
def find(toLookIn,toFind):
	index=string.find(toLookIn,toFind)
	return toLookIn[index:index+len(toFind)]
        

