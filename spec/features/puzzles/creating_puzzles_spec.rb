require "rails_helper"

RSpec.feature "Users can create new puzzles" do 
	before do 
		visit "puzzles#index"

		click_link "New Puzzle"
	end

	scenario "with valid attributes" do 
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

	scenario "when providing invalid attributes" do 
		click_button "Create Puzzle"

		expect(page).to have_content "Puzzle has not been created."
		expect(page).to have_content "Name can't be blank"
		expect(page).to have_content "Description can't be blank"
		expect(page).to have_content "Contract can't be blank"
		expect(page).to have_content "Solution can't be blank"
	end

end
