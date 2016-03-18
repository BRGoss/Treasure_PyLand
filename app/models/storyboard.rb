class Storyboard < ActiveRecord::Base
	has_many :frames, dependent: :delete_all

	validates :title, presence: true
	validates :description, presence: true
	
end
