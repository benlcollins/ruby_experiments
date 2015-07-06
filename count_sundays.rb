# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

# Project Euler Problem 19: https://projecteuler.net/problem=19

require 'pry'
require 'date'


def count_sundays_in_year
    counter = 1
    sundays = 0

    months = [31,28,31,30,31,30,31,31,30,31,30,31]

    months.each do |month|
        month.times do |day|
            if (counter % 7 == 6) && day == 0
                array = [counter,day]
                puts array
                sundays += 1
            end
            counter += 1
            day += 1
        end
    end
    
    return sundays

end




def count_sundays_in_period(start_year, end_year)
	sundays = 0
	day = Date.new(start_year).wday - 1


	# day = 1

	start_year.upto(end_year) do |year|
		months = [31,28,31,30,31,30,31,31,30,31,30,31]
		if leap_year(year) then months[1] = 29 end
		months.each do |month|
			sundays += 1 if day == 6
			day = (day + month) % 7
		end
	end

	return sundays
end





def count_sundays_in_20_century
	sundays = 0
	day = 1

	1901.upto(2000) do |year|
		months = [31,28,31,30,31,30,31,31,30,31,30,31]
		if leap_year(year) then months[1] = 29 end
		months.each do |month|
			sundays += 1 if day == 6
			day = (day + month) % 7
		end
	end

	return sundays
end





# @days = (0..6).to_a
@months = [31,28,31,30,31,30,31,31,30,31,30,31]
@leapmonths = [31,29,31,30,31,30,31,31,30,31,30,31]



def leap_year(year)
	year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) ? true : false
end



def count_sundays_in_century2
	total = 0
	year = 1901
	day = 1

	100.times do
		count_sundays_in_year(year,day % 7)
		total += @sundays
		leap_year(year) ? day = (@counter % 366) + 1 : day = (@counter % 365) + 1
		year += 1
		# array = [year, day, @sundays, total]
		# print array
	end
	return total
end


def count_sundays_in_year(year,start)
	@counter = start
	@sundays = 0

	leap_year(year) ? months = @leapmonths : months = @months

	months.each do |month|
		month.times do |day|
			if (@counter % 7 == 6) && day == 0
				array = [@counter,day]
				puts array
				@sundays += 1
			end
			@counter += 1
			day += 1
		end
	end
	
	return @sundays, @counter

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
