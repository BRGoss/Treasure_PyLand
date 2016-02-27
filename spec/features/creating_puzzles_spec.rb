require "rails_helper"

RSpec.feature "Users can create new puzzles" do 
	scenario "with valid attributes" do 
		visit "puzzles#index"

		click_link "New Puzzle"

		fill_in "Name", with: "Reverse String"
		fill_in "Description", with: "Reverse a string"
		fill_in "Contract" , with: "Design by contract"
		fill_in "Solution", with: "Code goes here"
		click_button "Create Puzzle"

		expect(page).to have_content "Puzzle has been created."

		puzzle  = Puzzle.find_by(name: "Reverse String")
		expect(page.current_url).to eq puzzle_url(puzzle)

		title = "Reverse String - Puzzles"
		expect(page).to have_title title
	end
end
