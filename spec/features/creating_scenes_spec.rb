require "rails_helper"

RSpec.feature "Users can create new scenes" do 
	scenario "with valid attributes" do 
		visit "scenes#index"

		click_link "New Scene"

		fill_in "Title", with: "Meet Long John Slither"
		fill_in "Description", with: "A dread Pyrate is encountered!"
		fill_in "Visual", with: "Code goes here"
		click_button "Create Scene"

		expect(page).to have_content "Scene has been created."
	end
end
