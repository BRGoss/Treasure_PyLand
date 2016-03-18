require "rails_helper"

RSpec.feature "Users can create new frames" do 
	before do 
		storyboard = FactoryGirl.create(:storyboard, title: "Alpha Board")
		FactoryGirl.create(:scene, title: "Scene One")
		FactoryGirl.create(:scene, title: "Scene Two")
		FactoryGirl.create(:scene, title: "Scene Three")
		FactoryGirl.create(:puzzle, name: "Puzzle One")
		FactoryGirl.create(:puzzle, name: "Puzzle Two")
		FactoryGirl.create(:puzzle, name: "Puzzle Three")

		visit storyboard_path(storyboard)
		click_link "New Frame"
	end

	scenario "with valid attributes" do 
		fill_in "Frame Order", with: 1
		select "Scene Two", from: "Scene"
		select "Puzzle Three", from: "Puzzle"
		click_button "Create Frame"

		expect(page).to have_content "Frame has been created."
	end

	scenario "when providing invalid attributes" do 
		click_button "Create Frame"

		expect(page).to have_content "Frame has not been created."
		expect(page).to have_content "Frame order can't be blank"
#		expect(page).to have_content "Scene can't be blank"
#		expect(page).to have_content "Puzzle can't be blank"
	end
end

