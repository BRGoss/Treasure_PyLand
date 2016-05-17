class AddDebugModeToStoryboards < ActiveRecord::Migration
  def change
    add_column :storyboards, :debug_mode, :boolean
  end
end
