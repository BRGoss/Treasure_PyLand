class Game < ActiveRecord::Base

	def self.testing_code(code, arg, debug)
		#return true
		#return %x{python3 Paul/graderPaul.py app/models/testcode.txt "'hELLO_worLD'" }
		filename = random_string
		File.open("app/student_code/#{filename}", "w") do |f|
			f.puts("#{code}")
			f.close
		end
		
		value = %x{python Paul/graderPaul.py app/student_code/#{filename} '#{arg}' }
		if debug then puts "Value = " + value end
		return value
	end

	protected

	def self.random_string
    	@string ||= "#{SecureRandom.urlsafe_base64}.txt"
  	end
end

