class Scene < ActiveRecord::Base
	validates :title, presence: true
	validates :description, presence: true
	validates :visual, presence: true	
end
