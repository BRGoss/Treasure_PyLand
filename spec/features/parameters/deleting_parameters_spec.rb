require "rails_helper"

RSpec.feature "Users can delete parameters" do 
	let(:puzzle) { FactoryGirl.create(:puzzle) }
	let(:parameter) { FactoryGirl.create(:parameter, puzzle: puzzle) }

	before do 
		visit puzzle_parameter_path(puzzle, parameter)
	end

	scenario "successfully" do 
		click_link "Delete Parameter"

		expect(page).to have_content "Parameter has been deleted."
		expect(page.current_url).to eq puzzle_url(puzzle)
	end
end
