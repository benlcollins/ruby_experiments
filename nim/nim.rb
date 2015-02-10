# create basic game of Nim in Ruby
require 'pry'

class NimGame

	def initialize
		@pile1 = rand(10) + 2
	end

	# getter
	def pile
		return @pile1
	end

	def player_turn
		puts "The Nim pile currently has #{pile} matches in it"
		puts "Please pick a positive number less than or equal to #{@pile1}"
		number = gets.chomp.to_i
		if number <= 0
			"Please pick a positive number less than or equal to #{@pile1}"
			return player_turn
		elsif number > @pile1
			return "Please pick a number less than or equal to #{@pile1}"
		else
			return @pile1 -= number
		end
	end

	def comp_turn
		puts "The Nim pile currently has #{pile} matches in it"
		puts "The computer will now take a turn"
		number = rand(@pile1) + 1
		puts "The computer chooses #{number}"
		return @pile1 -= number
	end
end

game1 = NimGame.new

puts @pile1

binding.pry