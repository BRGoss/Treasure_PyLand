#In this context, a unique word is a word with all unique letters
#Contract: Define a function that takes one string. The function will
#          find all unique words in the string. Each word is seperated
#          by a single space. It will return a string of all the unique
#          words seperated by a space. If there are no unique words
#          return the string 'No unique words found'
#          Note that the function should be case insensitive, i.e
#          'T'=='t'
#Input:    'Turn immediately right at all the tree stump'
#Output:   'Turn right at the stump'



def findUniqueWords(theString):
    theList=theString.split(' ')
    theAnswer = ''
    isUnique = True
    for word in theList:
        theWord=word.lower()
        theSet=set(theWord)
        if len(theSet) != len(theWord):
            isUnique = False
        if isUnique:
            theAnswer +=word+' '
        isUnique = True
    if theAnswer == '':
        theAnswer = 'No unique words found'
    else:
        theAnswer=theAnswer[:len(theAnswer)-1]
    return theAnswer
