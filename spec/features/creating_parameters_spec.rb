require "rails_helper"

RSpec.feature "Users an create new parameters" do 
	before do 
		puzzle = FactoryGirl.create(:puzzle, name: "Palindrome")

		visit puzzle_path(puzzle)
		click_link "New Parameter"
	end

	scenario "with valid attributes" do 
		fill_in "Input", with: "String input"
		fill_in "Output", with: "String output"
		click_button "Create Parameter"

		expect(page).to have_content "Parameter has been created."
	end

	scenario "when providing invalid attributes" do 
		click_button "Create Parameter"

		expect(page).to have_content "Parameter has not been created."
		expect(page).to have_content "Input can't be blank"
		expect(page).to have_content "Output can't be blank"
	end
end
