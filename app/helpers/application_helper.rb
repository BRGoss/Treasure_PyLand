module ApplicationHelper
	def title(*parts)
		unless parts.empty?
			content_for :title do 
				(parts << "Treasure PyLand").join(" - ")
			end
		end
	end
end
