require "rails_helper"

RSpec.feature "Users can edit existing parameters" do 
	let(:puzzle) { FactoryGirl.create(:puzzle) }
	let(:parameter) { FactoryGirl.create(:parameter, puzzle: puzzle) }

	before do 
		visit puzzle_parameter_path(puzzle, parameter)
		click_link "Edit Parameter"
	end

	scenario "with valid attributes" do 
		fill_in "Input", with: "Different string"
		click_button "Update Parameter"

		expect(page).to have_content "Parameter has been updated."

		within ("#parameter h2") do 
			expect(page).to have_content "Different string"
			expect(page).not_to have_content parameter.input
		end
	end

	scenario "with invalid attributes" do 
		fill_in "Input", with: ""
		click_button "Update Parameter"

		expect(page).to have_content "Parameter has not been updated."
	end
end
