class PuzzlesController < ApplicationController

	def index
	end

	def new
		@puzzle = Puzzle.new
	end

	def create
		@puzzle = Puzzle.new(puzzle_params)

		if @puzzle.save
			flash[:notice] = "Puzzle has been created."
			redirect_to @puzzle
		else
			#nothing yet
		end
	end

	def show
		@puzzle = Puzzle.find(params[:id])
	end

	private

	def puzzle_params
		params.require(:puzzle).permit(:name, :description, :contract, :solution)
	end
end
