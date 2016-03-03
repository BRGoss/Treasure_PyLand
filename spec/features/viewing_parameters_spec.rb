require "rails_helper"

RSpec.feature "Users can view parameters" do 
	before do 
		palindrome = FactoryGirl.create(:puzzle, name: "Palindrome")
		FactoryGirl.create(:parameter, puzzle: palindrome,
			input: "Palindrome string",
			output: "Not a palindrome!")

		title = FactoryGirl.create(:puzzle, name: "Title")
		FactoryGirl.create(:parameter, puzzle: title,
			input: "this is soon to be a title",
			output: "This Is Soon To Be A Title")

		visit "puzzles#index"
	end

	scenario "for a given project" do 
		click_link "Palindrome"

		expect(page).to have_content "Palindrome string"
		expect(page).to_not have_content "this is soon to be a title"

		click_link "Palindrome string"
		within("#parameter h2") do 
			expect(page).to have_content "Palindrome string"
		end

		expect(page).to have_content "Not a palindrome!"
	end
end
