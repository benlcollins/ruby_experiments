require 'pry'

# the short ruby way!!
def is_palindrome?(string)
	return string == string.reverse()
end

# the long hand way of doing it
def is_palindrome_long?(string)
	array = string.split("")

	for i in 0..array.length
		if array[i] != array[-i-1]
			return false
		end
	end

	return true
end

puts "Enter a string:"
string = gets.chomp

if is_palindrome_long?(string)
	puts "#{string} is a palindrome"
else
	puts "#{string} is not a palindrome"
end

