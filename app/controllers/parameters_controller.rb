class ParametersController < ApplicationController
	before_action :set_puzzle
	before_action :set_parameter, only: [:show, :edit, :update, :destroy]

	def new
		@parameter = @puzzle.parameters.build
	end

	def create
		@parameter = @puzzle.parameters.build(parameter_params)

		if @parameter.save
			flash[:notice] = "Parameter has been created."
			redirect_to [@puzzle, @parameter]
		else
			flash.now[:alert] = "Parameter has not been created."
			render "new"
		end
	end

	def show

	end

	private

	def set_puzzle
		@puzzle = Puzzle.find(params[:puzzle_id])
	end

	def set_parameter
		@parameter = @puzzle.parameters.find(params[:id])
	end

	def parameter_params
		params.require(:parameter).permit(:input, :output)
	end
end
