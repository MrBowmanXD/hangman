module Message
	def intro_message
		puts "Welcome to the hangman game bro\n\n"
		puts "What is your name?"
	end
end

class Game
	include Message

	def initialize
		@start = true
		intro_message
		@player_name = gets.chomp
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
		@secret_word = words_to_choose.sample
		@secret_word
	end

	public
	def hangman_display
		i = 0
		word = secret_word_generator
		puts word
		loop do

			print "_ "

			i += 1
			if i == @secret_word.length
				break
			end
		end
	end
end

game = Game.new
game.hangman_display