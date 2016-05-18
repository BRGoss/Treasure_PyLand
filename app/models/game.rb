class Game < ActiveRecord::Base

	def self.testing_code(code, arg, debug)
		if code.empty? 
			return "Sorry, but you need to input in some code first"
		else
			filename = write_to_file(code)
			value = %x{python Paul/graderPaul.py app/student_code/#{filename} '#{arg}' }
			if debug then puts "Value = " + value end
			return value
		end
	end

	protected

	def self.random_string
    	@string ||= "#{SecureRandom.urlsafe_base64}.txt"
  	end

  	def self.write_to_file(code)
  		filename = random_string
  		File.open("app/student_code/#{filename}", "w") do |f|
  			f.puts("#{code}")
  			f.close
  		end
  		return filename
  	end
end

