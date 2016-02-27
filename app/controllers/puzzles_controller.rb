class PuzzlesController < ApplicationController

	def index
		@puzzles = Puzzle.all 
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
			flash.now[:alert] = "Puzzle has not been created."
			render "new"
		end
	end

	def show
		@puzzle = Puzzle.find(params[:id])
	end

	def edit
		@puzzle = Puzzle.find(params[:id])
	end

	def update
		@puzzle = Puzzle.find(params[:id])
		@puzzle.update(puzzle_params)

		if @puzzle.update(puzzle_params)
			flash[:notice] = "Puzzle has been updated."
			redirect_to @puzzle
		else
			flash.now[:alert] = "Puzzle has not been updated."
			render "edit"
		end
	end

	def destroy
		@puzzle = Puzzle.find(params[:id])
		@puzzle.destroy

		flash[:notice] = "Puzzle has been deleted."
		redirect_to puzzles_path
	end

	private

	def puzzle_params
		params.require(:puzzle).permit(:name, :description, :contract, :solution)
	end
end
