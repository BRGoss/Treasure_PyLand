require "rails_helper"

RSpec.feature "Users can view uzzles" do 
	scenario "with the puzzle details" do
		puzzle = FactoryGirl.create(:puzzle, name: "Reverse String")

		visit "puzzles#index"
		click_link "Reverse String"
		expect(page.current_url).to eq puzzle_url(puzzle)
	end

end