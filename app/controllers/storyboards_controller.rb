class StoryboardsController < ApplicationController
	
	before_action :set_storyboard, only: [:show, :edit, :update, :destroy]

	def index
		@storyboards = Storyboard.all
	end

	def new
		@storyboard = Storyboard.new
	end

	def create
		@storyboard = Storyboard.new(storyboard_params)

		if @storyboard.save
			flash[:notice] = "Storyboard has been created."
			redirect_to @storyboard 
		else
			flash.now[:alert] = "Storyboard has not been created."
			render "new"
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		@storyboard.update(storyboard_params)

		if @storyboard.update(storyboard_params)
			flash[:notice] = "Storyboard has been updated."
			redirect_to @storyboard
		else
			flash.now[:alert] = "Storyboard has not been updated."
			render "edit"
		end
	end

	def destroy
		@storyboard.destroy

		flash[:notice] = "Storyboard has been deleted."
		redirect_to storyboards_path
	end

	private

	def storyboard_params
		params.require(:storyboard).permit(:title, :description, :default)
	end

	def set_storyboard
		@storyboard = Storyboard.find(params[:id])
		rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The storyboard you were looking for could not be found."
		redirect_to storyboards_path
	end
end
