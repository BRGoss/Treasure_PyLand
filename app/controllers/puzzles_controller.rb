class PuzzlesController < ApplicationController
	before_action :set_puzzle, only: [:show, :edit, :update, :destroy]

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
		
	end

	def edit
		
	end

	def update
		
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
		
		@puzzle.destroy

		flash[:notice] = "Puzzle has been deleted."
		redirect_to puzzles_path
	end

	private

	def puzzle_params
		params.require(:puzzle).permit(:name, :description, :contract, :solution)
	end

	def set_puzzle
		@puzzle = Puzzle.find(params[:id])
		rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The puzzle you were looking for could not be found."
		redirect_to puzzles_path
	end
end
