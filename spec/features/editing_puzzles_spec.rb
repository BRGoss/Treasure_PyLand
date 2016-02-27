require "rails_helper"

RSpec.feature "Users can edit existing puzzles" do 
	before do 
		FactoryGirl.create(:puzzle, name: "Reverse String")

		visit "puzzles#index"

		click_link "Reverse String"
		click_link "Edit Puzzle"
	end

	scenario "with valid atttributes" do 
		fill_in "Name", with: "Reverse a Reverse String"
		click_button "Update Puzzle"

		expect(page).to have_content "Puzzle has been updated."
		expect(page).to have_content "Reverse a Reverse String"
	end

	scenario "when providing invalid attributes" do 
		fill_in "Name", with: ""
		click_button "Update Puzzle"

		expect(page).to have_content "Puzzle has not been updated."
	end
	
end
