require "rails_helper"

RSpec.feature "Users can view frames" do 
	before do 
		story = FactoryGirl.create(:storyboard, title: "Alpha Board")
		frame1 = FactoryGirl.create(:frame, storyboard: story, frame_order: 1)
		frame2 = FactoryGirl.create(:frame, storyboard: story, frame_order: 2)
		frame3 = FactoryGirl.create(:frame, storyboard: story, frame_order: 3)
		scene1 = FactoryGirl.create(:scene, title: "Scene Two")
		scene1.frame_id = frame2.id
		scene1.save
		scene2 = FactoryGirl.create(:scene, title: "Scene Three")
		scene2.frame_id = frame3.id
		scene2.save
		scene3 = FactoryGirl.create(:scene, title: "Scene One")
		scene3.frame_id =  frame1.id
		scene3.save
		puzzle1 = FactoryGirl.create(:puzzle, name: "Puzzle Three")
		puzzle1.frame_id = frame3.id
		puzzle1.save
		puzzle2 = FactoryGirl.create(:puzzle, name: "Puzzle One")
		puzzle2.frame_id = frame1.id
		puzzle2.save
		puzzle3 = FactoryGirl.create(:puzzle, name: "Puzzle Two")
		puzzle3.frame_id = frame2.id
		puzzle3.save

		visit "storyboards#index"
	end

	scenario "for a given storyboard" do 
		click_link "Alpha Board"

		expect(page).to have_content "1 - Scene One - Puzzle One"
		expect(page).to have_content "2 - Scene Two - Puzzle Two"
		expect(page).to have_content "3 - Scene Three - Puzzle Three"

	end
end