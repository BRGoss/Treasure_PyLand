require "rails_helper"

RSpec.feature "Users can create new scenes" do
	before do 
		visit "scenes#index"

		click_link "New Scene"
	end 
	scenario "with valid attributes" do 
		fill_in "Title", with: "Meet Long John Slither"
		fill_in "Description", with: "A dread Pyrate is encountered!"
		fill_in "Visual", with: "Code goes here"
		click_button "Create Scene"

		expect(page).to have_content "Scene has been created."

		scene = Scene.find_by(title: "Meet Long John Slither")
		expect(page.current_url).to eq scene_url(scene)

		title = "Meet Long John Slither"
		expect(page).to have_title title 
	end

	scenario "when providing invalid attributes" do 
		click_button "Create Scene"

		expect(page).to have_content "Scene has not been created."
		expect(page).to have_content "Title can't be blank"
		expect(page).to have_content "Description can't be blank"
		expect(page).to have_content "Visual can't be blank"
	end
end
