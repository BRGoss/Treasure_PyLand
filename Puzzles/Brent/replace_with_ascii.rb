#DESCRIPTION:  Replace a string of numbers with their ASCII character equivalent
#ALGORITHM:    Split the string to get each individual number, convert the string
#			  number to an integer.  Both Ruby and Python have commands to translate
#			  an int into a ascii char, or vice versa.  Then iterate through each and convert  Below is the ruby code.  You can find info on how you might do this in python at:
#			  http://stackoverflow.com/questions/308749/whats-the-opposite-of-chr-in-ruby


def replace_with_ascii(input)
	ints = input.split
	output = ""
	ints.each do |t|
		t = t.to_i
		output += t.chr 
	end
	puts output
end

replace_with_ascii("97 98 99 100 101")
#This returns abcde