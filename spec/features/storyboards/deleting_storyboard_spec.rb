require "rails_helper"

RSpec.feature "USers can delete storyboards" do 
	scenario "successfully" do 
		FactoryGirl.create(:storyboard, title: "Alpha Board")

		visit "storyboards#index"
		click_link "Alpha Board"
		click_link "Delete Storyboard"

		expect(page).to have_content "Storyboard has been deleted."
		expect(page.current_url).to eq storyboards_url
		expect(page).to have_no_content "Alpha Board"
	end
end