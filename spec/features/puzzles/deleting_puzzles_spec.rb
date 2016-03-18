require "rails_helper"

RSpec.feature "Users can delete puzzles" do 
	scenario "successfully" do 
		FactoryGirl.create(:puzzle, name: "Reverse String")

		visit "puzzles#index"
		click_link "Reverse String"
		click_link "Delete Puzzle"

		expect(page).to have_content "Puzzle has been deleted."
		expect(page.current_url).to eq puzzles_url
		expect(page).to have_no_content "Reverse String"
	end
end