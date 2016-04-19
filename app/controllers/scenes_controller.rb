class ScenesController < ApplicationController

	before_action :set_scene, only: [:show, :edit, :update, :destroy]

	def index
		@scenes = Scene.all 
	end

	def new
		@scene = Scene.new
	end

	def create
		@scene = Scene.new(scene_params)

		if @scene.save
			flash[:notice] = "Scene has been created."
			redirect_to @scene
		else
			flash.now[:alert] = "Scene has not been created."
			render "new"
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		
		if @scene.update(scene_params)
			flash[:notice] = "Scene has been updated."
			redirect_to @scene
		else
			flash.now[:alert] = "Scene has not been updated."
			render "edit"
		end
	end

	def destroy
		
		@scene.destroy

		flash[:notice] = "Scene has been deleted."
		redirect_to scenes_path
	end

	private

	def scene_params
		params.require(:scene).permit(:title, :description, :transcript, :visual)
	end

	def set_scene
		@scene = Scene.find(params[:id])
		rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The scene you were looking for could not be found."
		redirect_to scenes_path
	end
end
