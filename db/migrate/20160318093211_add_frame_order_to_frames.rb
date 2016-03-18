class AddFrameOrderToFrames < ActiveRecord::Migration
  def change
  	add_column :frames, :frame_order, :integer
  end
end
