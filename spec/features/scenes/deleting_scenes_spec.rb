require "rails_helper"

RSpec.feature "Users can delete scenes" do 
	scenario "successfully" do 
		FactoryGirl.create(:scene, title: "Meeting Long John Slither")

		visit "scenes#index"
		click_link "Meeting Long John Slither"
		click_link "Delete Scene"

		expect(page).to have_content "Scene has been deleted."
		expect(page.current_url).to eq scenes_url
		expect(page).to have_no_content "Meeting Long John Slither"
	end
end
