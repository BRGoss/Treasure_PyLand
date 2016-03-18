require 'rails_helper'

RSpec.describe StoryboardsController, type: :controller do

	it "handles a missing storyboard correctly" do 
		get :show, id: "not-here"

		expect(response).to redirect_to(storyboards_path)
	end

end
