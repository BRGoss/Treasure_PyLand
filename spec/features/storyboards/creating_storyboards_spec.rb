require "rails_helper"

RSpec.feature "Users can create new storyboards" do 
	before do 
		visit "storyboards#index"

		click_link "New Storyboard"
	end

	scenario "with valid attributes" do 
		fill_in "Title", with: "Alpha Board"
		fill_in "Description", with: "First one down"
		check "Use As Default"

		click_button "Create Storyboard"

		expect(page).to have_content "Storyboard has been created."

		storyboard = Storyboard.find_by(title: "Alpha Board")
		expect(page.current_url).to eq storyboard_url(storyboard)

		title = "Alpha Board"
		expect(page).to have_title title
	end

	scenario "when providing invalid attributes" do 
		click_button "Create Storyboard"

		expect(page).to have_content "Storyboard has not been created."
		expect(page).to have_content "Title can't be blank"
		expect(page).to have_content "Description can't be blank"
	end
end
