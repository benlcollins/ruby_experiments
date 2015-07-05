# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

# Project Euler Problem 19: https://projecteuler.net/problem=19

require 'pry'


# @days = (0..6).to_a
@months = [31,28,31,30,31,30,31,31,30,31,30,31]
@leapmonths = [31,29,31,30,31,30,31,31,30,31,30,31]

@months.reduce(:+)

def count_sundays_in_century
	total = 0
	year = 1901
	day = 1

	100.times do
		# binding.pry
		count_sundays_in_year(year,day % 7)
		# binding.pry
		total += @sundays
		leap_year(year) ? day = (@counter % 366) + 1 : day = (@counter % 365) + 1
		# day = (@counter % 365) + 1
		year += 1
		# array = [year, day, @sundays, total]
		# print array
	end

	return total
end

def leap_year(year)
	year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) ? true : false
end

def count_sundays_in_year(year,start)
	@counter = start
	@sundays = 0

	leap_year(year) ? months = @leapmonths : months = @months
	# loop through days in january (31)
	# begin on Tuesday
	# T, W, T, F, S, S (count), M, T, W, T, F, S, S (count), M, T etc..
	months.each do |month|
		month.times do |day|
			if (@counter % 7 == 6) && day == 0
				array = [@counter,day]
				# puts array
				@sundays += 1
			end
			@counter += 1
			# puts day
			day += 1
		end
	end
	
	return @sundays, @counter
	# binding.pry

	# weeks = 31 / 7
	# remainder = 31 % 7
	# puts @days * weeks


	# weeks = 365 / 7
	# weeks.times do 
	# 	@days.each do |i|
	# 		if i == 6 
	# 			@@sundays += 1 
	# 		end
	# 		i += 1

	# 	end
	# end
	# binding.pry

	# puts weeks.to_f

end


# Peter's solution:

sundays = 0

# day 1 is monday, day 6 is sunday
day = 1

1901.upto(2000) do |year|
  months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  if year % 4 == 0 && (year % 100 != 0 || year % 400 == 0 )
    months[1] = 29 
  end
  months.each do |month|
    sundays += 1 if day == 6
    day = (day + month) % 7
  end
end

puts sundays


binding.pry
