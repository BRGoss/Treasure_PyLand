class CreateStoryboards < ActiveRecord::Migration
  def change
    create_table :storyboards do |t|
      t.string :title
      t.text :description
      t.boolean :default

      t.timestamps null: false
    end
  end
end
