class Puzzle < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	validates :contract, presence: true
	validates :solution, presence: true
end
