class AddAssociations < ActiveRecord::Migration
  def change
  	add_reference :scenes, :frame, index: true
  	add_foreign_key :scenes, :frames
  	add_reference :puzzles, :frame, index: true
  	add_foreign_key :puzzles, :frames
  end
end
