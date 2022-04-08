module Message
	def intro_message
		puts "Welcome to the hangman game bro"
	end
end

class Game

	def initialize
		@start = true
		intro_message
	end

	public
	def secret_word_generator
		file = File.open("google-10000-english-no-swears.txt")
		file_data = file.read
		file_array = file_data.split("\n")
		words_to_choose = file_array.map do |word|
			if word.length > 5 && word.length < 12
				word		
			end
		end
		words_to_choose = words_to_choose.compact
		secret_word = words_to_choose.sample
		secret_word
	end
end

game = Game.new
puts game.secret_word_generator