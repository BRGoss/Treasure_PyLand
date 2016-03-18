class FramesController < ApplicationController

	before_action :set_storyboard
	before_action :set_frame, only: [:show, :edit, :update, :destroy]
	before_action :set_puzzle, only: [:create]
	before_action :set_scene, only: [:create]

	def new
		@frame = @storyboard.frames.build
		@puzzles = Puzzle.all
		@scenes = Scene.all 
	end

	def create
		@frame = @storyboard.frames.build(frame_params)
		
		if @frame.save
			@puzzle.update_attributes(:frame_id => @frame.id)
			@scene.update_attributes(:frame_id => @frame.id)
			flash[:notice] = "Frame has been created."
			redirect_to [@storyboard, @frame]
		else
			flash.now[:alert] = "Frame has not been created."
			render "new"
		end
	end

	def show

	end

	def edit

	end

	def update
		if @frame.update(frame_params)
			flash[:notice] = "Frame has been updated."
			redirect_to [@storyboard, @frame]
		else
			flash.now[:alert] = "Frame has not been updated."
			render "edit"
		end
	end

	def destroy
		@frame.destroy
		flash[:notice] = "Frame has been deleted."

		redirect_to @storyboard
	end
	


	private

	def set_storyboard
		@storyboard = Storyboard.find(params[:storyboard_id])
	end

	def frame_params
		params.require(:frame).permit(:frame_order)
	end

	def scene_params
		params.require(:frame).permit(:scene)
	end

	def puzzle_params
		params.require(:frame).permit(:puzzle)
	end

	def set_frame
		@frame = @storyboard.frames.find(params[:id])
	end

	def set_puzzle
		@puzzle = Puzzle.find(puzzle_params[:puzzle])
		rescue ActiveRecord::RecordNotFound
	end

	def set_scene
		@scene = Scene.find(scene_params[:scene])
		rescue ActiveRecord::RecordNotFound
	end

end
