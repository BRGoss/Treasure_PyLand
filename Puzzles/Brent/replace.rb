#DESCRIPTION: This function replaces a character in a string with something else
#ALGORITHM: Should be able to use string methods in Python to accomplish similar, look
#            for function/method for String replace
#
#NOTE:  May want to decide if should replace capital letters as well

def replace(words)
	rep = words.gsub("a", "bc")
	puts rep
	return rep
end

replace("abcdefg")
#Output: bcbcdefg
replace("Happy Aloha!")
#Output: Hbcppy Alohbc!
