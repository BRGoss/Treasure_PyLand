class Storyboard < ActiveRecord::Base

	validates :title, presence: true
	validates :description, presence: true
	
end