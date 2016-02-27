require 'rails_helper'

RSpec.describe PuzzlesController, type: :controller do
	it "handles a missing puzzle correctly" do 
		get :show, id: "not_here"

		expect(response).to redirect_to(puzzles_path)

		message = "The puzzle you were looking for could not be found."
		expect(flash[:alert]).to eq message
	end
end
