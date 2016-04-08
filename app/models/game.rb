class Game < ActiveRecord::Base

	def self.testing_code(code, arg)
		#return true
		#return %x{python3 Paul/graderPaul.py app/models/testcode.txt "'hELLO_worLD'" }
		filename = random_string
		File.open("app/student_code/#{filename}", "w") do |f|
			f.puts("#{code}")
			f.close
		end
		return %x{python3 Paul/graderPaul.py app/student_code/#{filename} #{arg} }
	end

	protected

	def self.random_string
    	@string ||= "#{SecureRandom.urlsafe_base64}.txt"
  	end
end

