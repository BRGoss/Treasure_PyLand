class Scene < ActiveRecord::Base
	belongs_to :frame
	
	validates :title, presence: true
	validates :description, presence: true
	validates :transcript, presence: true
	validates :visual, presence: true	
end
