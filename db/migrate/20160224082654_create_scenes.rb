class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :title
      t.string :description
      t.string :visual

      t.timestamps null: false
    end
  end
end
