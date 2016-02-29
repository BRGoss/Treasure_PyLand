class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :title
      t.column :description, :text
      t.column :visual, :text

      t.timestamps null: false
    end
  end
end
