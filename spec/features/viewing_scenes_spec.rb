require "rails_helper"

RSpec.feature "Users can view scenes" do 
	scenario "with the scene details" do 
		scene = FactoryGirl.create(:scene, title: "Meeting Long John Slither",
				description: "Meeting the infamous pyrate", visual: "code goes here")

		visit "scenes#index"
		click_link "Meeting Long John Slither"
		expect(page.current_url).to eq scene_url(scene)
	end
end
