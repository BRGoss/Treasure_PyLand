require "rails_helper"

RSpec.feature "Users can edit existing frames" do 

	before do 
		story = FactoryGirl.create(:storyboard, title: "Alpha Board")
		frame = FactoryGirl.create(:frame, storyboard: story, frame_order: 1)
		scene = FactoryGirl.create(:scene, title: "Scene One")
		scene.frame_id = frame.id
		scene.save
		puzzle = FactoryGirl.create(:puzzle, name: "Puzzle One")
		puzzle.frame_id = frame.id
		puzzle.save

		visit storyboard_frame_path(story, frame)
		click_link "Edit Frame"
	end

	scenario "with valid attributes" do 
		fill_in "Frame Order", with: 5
		click_button "Update Frame"

		expect(page).to have_content "Frame has been updated."

	end

	scenario "with invalid attributes" do 
		fill_in "Frame Order", with: ""
		click_button "Update Frame"

		expect(page).to have_content "Frame has not been updated."
	end
end
