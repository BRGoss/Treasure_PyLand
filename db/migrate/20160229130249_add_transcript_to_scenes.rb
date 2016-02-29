class AddTranscriptToScenes < ActiveRecord::Migration
  def change
    add_column :scenes, :transcript, :text
  end
end
