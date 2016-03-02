class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :input
      t.string :output
      t.references :puzzle, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
