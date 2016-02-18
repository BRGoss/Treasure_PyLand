#DESCRIPTION:  This function determines if a string is a palindrome or not.
#ALGORITHM:  Strip out any commas, spaces, or periods....could go further, but this is enough
#            Lowercase the word
#            Reverse the word
#            Compare the original with the reverse, return if True, False otherwise



def is_palindrome?(word)
	word = word.delete(' ')
	word = word.delete(',')
	word = word.delete('.')
	word = word.downcase
	rev = word.reverse
	if (word == rev)
		puts "True"
		return true
	else
		puts "False"
		return false
	end
end

is_palindrome?("mom")
#True
is_palindrome?("fast")
#False
is_palindrome?("race car")
#True
is_palindrome?("A man, a plan, a canal, Panama")
#True