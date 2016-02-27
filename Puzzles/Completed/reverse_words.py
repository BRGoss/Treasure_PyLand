DESCRIPTION:  Reverse the words in a sentence rather than all letters
ALGORITHM:    Split the string into it's word components
              Traverse the returned array in reverse order and joining
              each word/element with a space between
Example: Input = 'A long long time ago' Output = 'ago time long long A'

def split_words(sentence):
	words=' '.join(string.split(sentence,' ')[::-1])
	print words
	return 

