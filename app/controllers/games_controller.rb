class GamesController < ApplicationController
	respond_to :js, :json, only: [:test_code, :continue_game]
	respond_to :html, only: [:start_game, :game_over, :restart_game]
	before_action :test_params, only: [:test_code]
	before_action :continue_params, only: [:continue_game]

	def start_game
		# if session is nil, then start game fresh, otherwise
		# set puzzle back to first puzzle/scene
		@game = Game.new
		session[:frame] = session[:frame] || 1
		storyboard = Storyboard.find_by default: true
		if (finished?(session[:frame], storyboard))
			session[:frame] = 1
		end
		@story = storyboard.frames.find_by frame_order: session[:frame] 
		@para = @story.puzzle.parameters.all.sample
		render :start_game
	end

	def test_code
		# byebug
		puts "\n\n"
		puts "Testing Python Code"
		argument = Parameter.find(params[:parameter_id]).input
		correct_output = Parameter.find(params[:parameter_id]).output
		result = Game.testing_code(params[:code], argument)
		puts result
		puts "Done testing Python Code"
		puts "\n\n"
		result = true
		if (result)
			render :test_success
		else
			render :test_failure
		end
		
#		storyboard = Storyboard.find params[:story_id]
#		@story = storyboard.frames.find_by frame_order: params[:frame_order]

#		render :test_result
	end

	def continue_game
		# if params[:start_over]
		# 	render :start_game
		# 	return
		# end
		session[:frame] += 1
		@game = Game.new
		storyboard = Storyboard.find_by default: true
		if (finished?(session[:frame], storyboard))
			# render :text => 'window.location.href ="http://localhost:3000' + game_over_games_path + '";'
			render :text => 'window.location.href ="' + game_over_games_path + '";'
		else
			value = params[:frame_order]
			@story = storyboard.frames.find_by frame_order: (value.to_i + 1)
			@para = @story.puzzle.parameters.all.sample
			render :continue_game
		end
	end

	def restart_game
		session[:frame] = 1
		start_game
		# redirect_to url_for start_game_games_path
	end

	def game_over
		render :game_over
	end

	private

	def test_params
		params.require(:game).permit(:code, :puzzle_id, :parameter_id,
						:story_id, :frame_order)
	end

	def continue_params
		params.permit(:frame_order)
		value = params[:frame_order]
		puts "\n\ncontinue_params\n"
		puts value
	end

	def finished?(frame, storyboard)
		max = storyboard.frames.maximum("frame_order")
		puts "\n\nFrame #{max} > Max #{max}\n\n"
		frame > max
	end

end
