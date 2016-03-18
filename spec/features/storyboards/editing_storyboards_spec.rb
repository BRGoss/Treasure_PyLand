require "rails_helper"

RSpec.feature "Users can edit existing storyboards" do 
	before do 
		FactoryGirl.create(:storyboard, title: "Alpha Board")

		visit "storyboards#index"
		click_link "Alpha Board"
		click_link "Edit Storyboard"
	end

	scenario "with valid attributes" do 
		fill_in "Title", with: "Beta Board"
		click_button "Update Storyboard"

		expect(page).to have_content "Storyboard has been updated."
		expect(page).to have_content "Beta Board"
	end

	scenario "when providing inalid attributes" do 
		fill_in "Title", with: ""
		click_button "Update Storyboard"

		expect(page).to have_content "Storyboard has not been updated."
	end
end
