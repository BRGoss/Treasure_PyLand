require "rails_helper"

RSpec.feature "Users can edit existing projects" do 
	before do 
		FactoryGirl.create(:scene, title: "Meeting Long John Slither")

		visit "scenes#index"
		click_link "Meeting Long John Slither"
		click_link "Edit Scene"
	end

	scenario "with valid attributes" do 
		
		fill_in "Title", with: "Killing Long John Slither"
		click_button "Update Scene"

		expect(page).to have_content "Scene has been updated"
		expect(page).to have_content "Killing Long John Slither"
	end

	scenario "when providing invalid attributes" do 
		fill_in "Title", with: ""
		click_button "Update Scene"

		expect(page).to have_content "Scene has not been updated."
	end
end
