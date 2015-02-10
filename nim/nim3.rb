# This is version 3 of the Nim game
# Works for a three pile game starting between 10 and 20
# Ben Collins
# 2/10/15

class GameOfNim

	# initialize the three piles for start of game
	def initialize
		@first_pile = rand(10..20)
		@second_pile = rand(10..20)
		@third_pile = rand(10..20)
		@game_stack = [@first_pile,@second_pile,@third_pile]
	end

	# selects from the three piles based on user choice
	def choose_pile(number)
		return @game_stack[number - 1]
	end

	# method called to update the game_stack every time a move is made
	def update_pile(number,new_value)
		@game_stack[number - 1] = new_value
	end

	# method for player turn
	def player_turn
		puts "^^^^^^^^^^^^^^^^  Your turn  ^^^^^^^^^^^^^^^^"
		
		puts "Which pile will you pick from: 1, 2 or 3?"
		player_pile = gets.chomp.to_i

		# keep looping until player picks 1, 2 or 3
		while (player_pile != 1 && player_pile != 2 && player_pile != 3)
			puts "Please pick from 1, 2 or 3!"
			player_pile = gets.chomp.to_i
		end

		# keep looping until player picks a non zero pile
		while choose_pile(player_pile) == 0
			puts "Pile #{player_pile} is empty, please select a different pile"
			player_pile = gets.chomp.to_i
		end

		# retrieve the pile value based on which pile user chooses
		selected_pile_value = choose_pile(player_pile)

		# player turn to choose how many to select from chosen pile
		puts "Please pick a number less than or equal to #{selected_pile_value}"
		player_choice = gets.chomp.to_i

		# keep looping until player selects number less than or equal to pile
		while player_choice > selected_pile_value
			puts "No! That doesn't work"
			puts "Please choose a number LESS THAN OR EQUAL TO #{selected_pile_value}"
			player_choice = gets.chomp.to_i			
		end

		# update the pile after player turn
		selected_pile_value -= player_choice
		update_pile(player_pile,selected_pile_value)

		# print out a new game stack showing updated piles
		print "Game stack now at #{current_score} \n"

		return selected_pile_value # not used
	end

	# method for computer turn
	def computer_turn
		puts "+++++++++++++++++  Computer's turn  +++++++++++++++++"

		# computer chooses psuedo-random number between 1 and 3 inclusive
		computer_pile = rand(1..3)

		# retrieve the pile value based on computer random number
		selected_pile_value = choose_pile(computer_pile)
		
		# keep looping if pile has 0 value
		while selected_pile_value == 0
			computer_pile = rand(1..3)
			selected_pile_value = choose_pile(computer_pile)
		end
		
		# case when pile = 1, then computer 'chooses' value 1
		if selected_pile_value == 1
			computer_choice = 1
		
		# computer chooses random number between 1 and pile value inclusive
		else
			computer_choice = rand(1..selected_pile_value).to_i
		end
		
		# update the pile after computer turn
		selected_pile_value -= computer_choice
		update_pile(computer_pile,selected_pile_value)

		# print out computer's turn to show user
		puts "The computer chose pile #{computer_pile} and value #{computer_choice}"
		
		# print out a new game stack showing updated piles
		print "Game stack now at #{current_score} \n"

		return selected_pile_value  # not used
	end

	# getter to show current score on the game stack
	def current_score
		return @game_stack
	end

	# method to play game
	def play_game

		# ask who would like to go first, user or computer
		puts "Would you like to go first? Y/N"
		starter = gets.chomp.upcase

		# case when user takes first go
		if starter == "Y"
			while total(current_score) > 0
				player_turn
				
				# case when player wins
				if total(current_score) == 0
					puts "You win!"
					play_again
				end

				computer_turn

				# case when computer wins
				if total(current_score) == 0
					puts "The computer wins!"
					play_again
				end
			end
		
		# case when computer takes first go
		else
			while total(current_score) > 0
				computer_turn

				# case when player wins
				if total(current_score) == 0
					puts "The computer wins!"
					play_again
				end

				player_turn
				
				# case when computer wins
				if total(current_score) == 0
					puts "You win!"
					play_again
				end
			end
		end
	end

	# method to see if user would like to play again
	def play_again
		puts "Would you like to play again? Y/N"
		
		# setup the game to play again if user chooses Y
		if gets.chomp.upcase == "Y"
			initialize
			puts "Ok, let's play NIM again!"
			puts "The starting stack is #{@game_stack} \n"
			play_game
		else
			end_game
		end
	end

	# method to sum game stack array to declare winner
	def total(array)
		total = 0
		for number in array
			total += number
		end
		return total
	end

	# method to end game and exit app
	def end_game
		puts "Goodbye!"
		exit
	end
end

# create new instance of Game of Nim class
game1 = GameOfNim.new


puts "LET'S PLAY NIM!!!"
puts "The starting pile is #{game1.current_score} \n"

# begin the game
game1.play_game


