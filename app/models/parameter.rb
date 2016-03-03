class Parameter < ActiveRecord::Base
  belongs_to :puzzle

  validates :input, presence: true
  validates :output, presence: true
end
