class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :name
      t.column :description, :text
      t.column :contract, :text
      t.column :solution, :text

      t.timestamps null: false
    end
  end
end
