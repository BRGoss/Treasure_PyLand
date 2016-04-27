class Game < ActiveRecord::Base

	def self.testing_code(code, arg)
		#return true
		#return %x{python3 Paul/graderPaul.py app/models/testcode.txt "'hELLO_worLD'" }
		filename = random_string
		File.open("app/student_code/#{filename}", "w") do |f|
			f.puts("#{code}")
			f.close
		end
#		output = `/app/.heroku/python/bin/python /app/Paul/graderPaul.py`
#		value = %x{python3 Paul/graderPaul.py app/student_code/#{filename} '#{arg}' }
		value = `/app/.heroku/python/bin/python /app/Paul/graderPaul.py app/student_code/"#{filename}" "'#{arg}'"`
		puts "Value = " + value
		return value
	end

	protected

	def self.random_string
    	@string ||= "#{SecureRandom.urlsafe_base64}.txt"
  	end
end

