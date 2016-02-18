#DESCRIPTION:  You have a string of words, but extra words have been included that
#              are not necessary.  Each of the unnecessary words contains a letter
#              that is not included in the needed words.  For example "Turn zero
#              left zoom jazz at the zoo old booze tree", all the unneeded words have
#              the letter z in them.

#ALGORITHM:    Split the words up, then check each word to see if it contains the
#              letter, and if it does, remove it.  Attach each word back together
#              with a space in between.  Then print out the remaining words
#              as the correct string.


def remove_wrong_words(words)
	#This creates an array for each word as it splits the string on spaces
	search = words.split
	# This iterates over the array and checks each item.  If it contains a z, it's deleted
	search.delete_if { |x| x.include? "z" }
	output = ""
    search.each do |t|
    	output += t + " "
    end
    puts output
end

remove_wrong_words("Turn zero left zoom jazz at the zoo old booze tree")
#This returns "Turn left at the old tree"