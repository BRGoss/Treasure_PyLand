#In this context, a unique word is a word with all unique letters
#Contract: Define a function that takes one string. The function will
#          find all unique words in the string. Each word is seperated
#          by a single space. It will return a string of all the unique
#          words seperated by a space. If there are no unique words
#          return the string 'No unique words found'
#Input:    'Turn immediately right at all the tree stump'
#Output:   'Turn right at the stump'



def findUniqueWords(theString):
    theList=theString.split(' ')
    theAnswer = ''
    isUnique = True
    for word in theList:
        theWord=word.lower()
        index = 0
        while index < len(word):
            theLetter = theWord[index:index+1]
            secondIndex=index+1
            while secondIndex < len(word):
                if theLetter == theWord[secondIndex:secondIndex+1]:
                    isUnique = False
                secondIndex += 1
            index += 1
        if isUnique:
            theAnswer +=word+' '
        isUnique = True
    if theAnswer == '':
        theAnswer = 'No unique words found'
    else:
        theAnswer=theAnswer[:len(theAnswer)-1]
    return theAnswer
