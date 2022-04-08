module Message
	def intro_message
		system("clear")
		puts "Welcome to the hangman game bro\n\n"
		puts "What is your name?"
	end

	def victory
		system("clear")
		puts "You win!\n"
		puts "Well done player."
	end

	def lost
		system("clear")
		puts "You lose!\n"
		puts "Mission failed, well get em next time."
	end
end

class Game
	include Message

	def initialize
		@start = true
		intro_message
		@player_name = gets.chomp
		@player_won = false
		@player_lost = false
		@i = 0
	end

	private
	def secret_word_generator
		file = File.open("google-10000-english-no-swears.txt")
		file_data = file.read
		file.close
		file_array = file_data.split("\n")
		words_to_choose = file_array.map do |word|
			if word.length > 5 && word.length < 12
				word		
			end
		end
		words_to_choose = words_to_choose.compact
		@secret_word = words_to_choose.sample.split("")
		@secret_word
	end

	private
	def hangman_set_up
		@word = secret_word_generator if @word.nil?
		@words_array = [Array.new(@word.length, '_ '), Array.new(@word.length, false)]
	end

	private
	def hangman_display
		@words_array[0].each {|letter| print letter }
	end

	public
	def game_play
		hangman_set_up
		while @player_won == false && @player_lost == false
			hangman_display
			round
		end
	end


	private
	def round
		@player_choice = gets.chomp
		@word.each_with_index do |char, index|
			if @player_choice == char && @words_array[1][index] == false
				@words_array[0][index] = char
				@words_array[1][index] = true
			end
		end
		if @words_array[0] == @word
			@player_won = true
			victory
		elsif @i == 15
			@player_lost = true
			lost
		end
		@i += 1
	end
end

game = Game.new
game.game_play