# Number Letter Count

# https://projecteuler.net/problem=17

# If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, 
# how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) 
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. 
# The use of "and" when writing out numbers is in compliance with British usage.

# NOTE 2: The code below works but I plan to come back and refactor at some point. 

require 'pry'

# setup initial word arrays as instance variables
@words = ["zero", 
					"one", 
					"two", 
					"three", 
					"four", 
					"five", 
					"six", 
					"seven", 
					"eight", 
					"nine",
					"ten", 
					"eleven", 
					"twelve", 
					"thirteen", 
					"fourteen", 
					"fifteen", 
					"sixteen", 
					"seventeen", 
					"eighteen", 
					"nineteen", 
					"twenty"]

@tens =  ["zero", 
					"ten", 
					"twenty", 
					"thirty", 
					"forty", 
					"fifty", 
					"sixty", 
					"seventy", 
					"eighty", 
					"ninety"]


# method to "wordify" any number between 1 and 99
def wordify_upto_99(number)
	# deal with the numbers 20 and under, straight from array
	if number < 21
		word = @words[number]

	# numbers 21 to 99, need to split and take from "@tens" array first digit
	elsif number < 100
		first = @tens[number.to_s.slice(0).to_i]
		if number.to_s.slice(1) == "0"
			second = ""
		else
			second = @words[number.to_s.slice(1).to_i]
		end
		word = first + " " + second
	else
		return "Number greater than 100! Not allowed with this method"
	end
	return word
end


# method to turn any number into its word equivalent
def wordify(number)
	# for numbers less than 100
	if number < 100
		word = wordify_upto_99(number)

	# numbers 100 to 999
	elsif number < 1000
		# get first digit and turn into "hundreds" e.g. "two hundred..."
		first = @words[number.to_s.slice(0).to_i]

		# get the hundreds part
		if number.to_s.slice(1,2) == "00"
			second_part = ""
		else
			second_part = " and " + wordify_upto_99(number.to_s.slice(1,2).to_i)
		end

		# put it all together
		word = first + " hundred" + second_part
	
	# final number could be one thousand
	else
		word = "one thousand"
	end

	return word
end


# method to get the length of the "wordified" number
def word_number_length(number)
	return wordify(number).delete(' ').length
end


# loop method to calculate the total length of all the numbers
def number_letter_count(n)
	total = 0
	n.times do |i|
		# puts wordify(i+1)  # uncomment if you want to print out the numbers
		total += word_number_length(i+1)
	end
	return total
end


# corresponding method to "de-wordify" a word number e.g.
# eight
# thirty six
# two hundred
# six hundred and forty one
def dewordify_upto_99(word_number)
	array = word_number.split(' ')

	if @words.include?(word_number) # scenario for numbers up to 20
		return @words.index(word_number)
	elsif @tens.include?(array[0]) # scenario for numbers between 21 and 99
		if array.length == 1
			return @tens.index(word_number) * 10
		else
			return (@tens.index(array[0]) * 10) + @words.index(array[1])
		end
	else
		return "Too big"
	end
end


def dewordify(word_number)
	array = word_number.split(' ')

	if dewordify_upto_99(word_number) != "Too big"
		return dewordify_upto_99(word_number)
	elsif array[1] == "hundred" # scenario for numbers between 100 and 999
		if array.length == 2
			return @words.index(array[0]) * 100
		elsif array.length == 4
			first = @words.index(array[0]) * 100
			second = dewordify_upto_99(array[3])
			return first.to_i + second.to_i
		else
			first = @words.index(array[0]) * 100
			second = dewordify_upto_99(array[3,4].join(" "))
			return first.to_i + second.to_i
		end
	elsif (array[0] == "thousand" && array.length == 1) || (array[0] == "one" && array[1] == "thousand")
		return 1000
	else
		return "Not valid. Please only call method for numbers less than 1000"
	end
end


# Arithmetic operations on word numbers

def plus(word_number1, word_number2)
	result = dewordify(word_number1) + dewordify(word_number2)
	if result > 1000
		return "Sorry answer > 1000"
	else
		return wordify(result)
	end
end

def subtract(word_number1, word_number2)
	result = dewordify(word_number1) - dewordify(word_number2)
	if result < 0
		return "Sorry answer < 0"
	else
		return wordify(result)
	end
end

def multiply(word_number1, word_number2)
	result = dewordify(word_number1) * dewordify(word_number2)
	if result > 1000
		return "Sorry answer > 1000"
	else
		return wordify(result)
	end
end

def divide(word_number1, word_number2)
	result = dewordify(word_number1).to_f / dewordify(word_number2).to_f
	if result.floor == result
		return wordify(result)
	else
		return "Sorry answer not an integer"
	end
end




binding.pry




