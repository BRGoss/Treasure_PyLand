require "rails_helper"

RSpec.feature "Users can delete tickets" do 
	before do 
		@storyboard = FactoryGirl.create(:storyboard, title: "Alpha Board")
		frame = FactoryGirl.create(:frame, storyboard: @storyboard, frame_order: 1)
		scene = FactoryGirl.create(:scene, title: "Scene One")
		scene.frame_id = frame.id
		scene.save
		puzzle = FactoryGirl.create(:puzzle, name: "Puzzle One")
		puzzle.frame_id = frame.id
		puzzle.save
		visit storyboard_frame_path(@storyboard, frame)
	end

	scenario "successfully" do 
		click_link "Delete Frame"

		expect(page).to have_content "Frame has been deleted."
		expect(page.current_url).to eq storyboard_url(@storyboard)
	end

end