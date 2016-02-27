class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :name
      t.string :description
      t.string :contract
      t.string :solution

      t.timestamps null: false
    end
  end
end
