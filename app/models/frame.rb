class Frame < ActiveRecord::Base
  belongs_to :storyboard
  has_one :scene
  has_one :puzzle

  validates :frame_order, presence: true
end
