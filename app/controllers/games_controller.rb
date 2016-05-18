class GamesController < ApplicationController
	layout "games_layout"
	respond_to :js, :json, only: [:test_code, :continue_game]
	respond_to :html, only: [:start_game, :game_over, :restart_game]
	before_action :test_params, only: [:test_code]
	before_action :continue_params, only: [:continue_game]
	before_action :set_debug, only: [:start_game, :test_code, :continue_game, :restart_game]
	before_action :get_success_message, only: [:start_game, :continue_game, :restart_game]

	def start_game

#		byebug
		# if session is nil, then start game fresh, otherwise
		# set puzzle back to first puzzle/scene
		@game = Game.new
		session[:frame] = session[:frame] || 1
		puts "Session is " + session[:frame].to_s
		storyboard = Storyboard.find_by default: true
#		if (finished?(session[:frame], storyboard)) then session[:frame] = 1 end
		@story = storyboard.frames.find_by frame_order: session[:frame] 
		@para = @story.puzzle.parameters.all.sample
		render :start_game
#		byebug
	end

	def test_code
		#byebug
		puts "\n\n"
		puts "Testing Python Code"
		argument = Parameter.find(params[:parameter_id]).input
		correct_output = Parameter.find(params[:parameter_id]).output
		result = Game.testing_code(params[:game][:code], argument, @debug)
		puts "Done testing Python Code"
		puts "\n\n"
		answer = (result.to_s.strip == correct_output.to_s.strip)
		if (answer)
			render :test_success
		else
			@errors = get_errors result
			render :test_failure
		end
	end

	def continue_game
		#byebug
		session[:frame] += 1
		puts "Session is now " + session[:frame].to_s
		@game = Game.new
		storyboard = Storyboard.find_by default: true
		if (finished?(session[:frame], storyboard))
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

	private

	def set_debug
		@debug = Storyboard.find_by(default: true).debug_mode
	end

	def test_params
		params.require(:game).permit(:code)
	end

	def continue_params
		params.permit(:frame_order)
	end

	def finished?(frame, storyboard)
		frame > storyboard.frames.maximum("frame_order")
	end

	def get_errors(result)
		if @debug
			result
		else
			result.partition('INCORRECT - ').last
		end
	end

	def get_success_message
		messages = ["Excelsior", "Success", "Fantastic", "Great",
					"Congratulations", "Excellent", "Stupendous"]
		@success = messages.sample
	end

end
