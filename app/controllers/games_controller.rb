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
		session[:frame] = 1 if (finished?(session[:frame], storyboard))
		@story = storyboard.frames.find_by frame_order: session[:frame] 
		@para = @story.puzzle.parameters.all.sample
		render :start_game
		#byebug
	end

	def test_code
		#byebug
		puts "\n\n"
		puts "Testing Python Code"
		argument = Parameter.find(params[:parameter_id]).input
		correct_output = Parameter.find(params[:parameter_id]).output
		result = Game.testing_code(params[:game][:code], argument)
		puts "Done testing Python Code"
		puts "\n\n"
		answer = (result.to_s.strip == correct_output.to_s.strip)
		if (answer)
			render :test_success
		else
			render :test_failure
		end
	end

	def continue_game
		#byebug
		@debug = true
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
	end

	def game_over
		render :game_over
	end

	def show_errors(result)
		render :show_errors
	end

	private

	def test_params
		params.require(:game).permit(:code)
	end

	def continue_params
		params.permit(:frame_order)
		value = params[:frame_order]
	end

	def finished?(frame, storyboard)
		frame > storyboard.frames.maximum("frame_order")
	end
end
