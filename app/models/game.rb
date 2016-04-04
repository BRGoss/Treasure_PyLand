class Game < ActiveRecord::Base

	def self.testing_code
		#return true
		return %x{python3 Paul/graderPaul.py app/models/testcode.txt "'hELLO_worLD'" }
	end
end
