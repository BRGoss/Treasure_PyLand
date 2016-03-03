class Puzzle < ActiveRecord::Base
	has_many :parameters, dependent: :delete_all

	validates :name, presence: true
	validates :description, presence: true
	validates :contract, presence: true
	validates :solution, presence: true
end
