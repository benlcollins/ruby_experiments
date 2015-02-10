# This is version 2 of the Nim game
# This appears to work consistently for a single pile game starting between 10 and 20
# Ben Collins
# 2/9/15

class GameOfNim

	def initialize
		@first_pile = rand(10..20)
	end

	def player_turn
		puts "Please pick a number less than or equal to #{@first_pile}"
		player_choice = gets.chomp.to_i
		
		if player_choice > @first_pile
			puts "No! That doesn't work"
			puts "Please choose a number LESS THAN OR EQUAL TO #{@first_pile}"
			player_turn
		else
			@first_pile -= player_choice
		end
		
		return @first_pile
	end

	def computer_turn
		if @first_pile == 1
			computer_choice = 1
		else
			computer_choice = rand(1..@first_pile).to_i
		end
		
		@first_pile -= computer_choice
		
		puts "The computer chooses #{computer_choice}"
		return @first_pile
	end

	def current_score
		return @first_pile
	end

	def play_game

		while current_score > 0
			player_turn
			puts "Now the pile is at #{current_score}"
	
			if current_score == 0
				puts "You win!"
				play_again
			end

			puts "Computer's turn"
			computer_turn
	
			if current_score == 0
				puts "The computer wins!"
				play_again
			end

			puts "Now the pile is at #{current_score}"
		end
	end

	def play_again
		puts "Would you like to play again? Y/N"
		if gets.chomp.upcase == "Y"
			initialize
			puts "Ok, let's play NIM again!"
			puts "The starting pile is #{@first_pile} \n"
			play_game
		else
			end_game
		end
	end

	def end_game
		puts "Goodbye!"
		exit
	end
end

game1 = GameOfNim.new

#binding.pry

puts "LET'S PLAY NIM!!!"
puts "The starting pile is #{game1.current_score} \n"
game1.play_game







