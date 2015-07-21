require 'pry'

@vowels = ["a","e","i","o","u"]

def count_vowels(string)
	array = string.split("").select do |letter| 
		@vowels.include?(letter)
	end

	return array.length
end

puts "Enter a string:"
string = gets.chomp
puts string + " has " + count_vowels(string).to_s + " vowels in it."