DESCRIPTION:  This function determines if a string is a palindrome or not.
ALGORITHM:  Strip out any commas, spaces, or periods....could go further, but this is enough
            Lowercase the word
            Reverse the word
            Compare the original with the reverse, return if True, False otherwise

Example: Input = 'A man, a plan, a canal, Panama' Output = 'True'
def is_palindrome(word):
	word=string.replace(word,' ','')
	word=string.replace(word,',','')
	word=string.replace(word,'.','')
	word=word.lower()
	rev = word[::-1]
	if (word == rev):
		print 'True'
		return 1
	else:
		print 'False'
		return 0

