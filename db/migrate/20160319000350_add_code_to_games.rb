class AddCodeToGames < ActiveRecord::Migration
  def change
  	add_column :games, :code, :text
  end
end
