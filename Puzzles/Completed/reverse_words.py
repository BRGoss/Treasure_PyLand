#DESCRIPTION:  Reverse the words in a sentence rather than all letters
#ALGORITHM:    Define a function called split_words that takes a string
#              as its input. The output is the inputs words put in reverse
#              order.
#Example: Input = 'A long long time ago' Output = 'ago time long long A'

def split_words(sentence):
	words=' '.join(string.split(sentence,' ')[::-1])
	return words

