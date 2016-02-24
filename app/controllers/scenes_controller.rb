class ScenesController < ApplicationController

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
		@scene = Scene.find(params[:id])
	end

	private

	def scene_params
		params.require(:scene).permit(:title, :description, :visual)
	end

end
