require "rails_helper"

RSpec.feature "Users can view storyboards" do 
	scenario "wih the storyboard details" do 
		storyboard = FactoryGirl.create(:storyboard, title: "Alpha Board")

		visit "storyboards#index"
		click_link "Alpha Board"
		expect(page.current_url).to eq storyboard_url(storyboard)
	end
end
