require 'pry'

# Q1. write a method that will return Pascal's triangle up to n rows
#       1
#      1 1
#     1 2 1
#    1 3 3 1
#   1 4 6 4 1
# 1 5 10 10 5 1

# Q2. write a method to return an array of the numbers 
# in the n-th row of a pascal triangle
# e.g. for n = 5 output should be [1,5,10]

# Second solution with refactored code

def array_transform(array)
	b = []
	l = array.length
	l.times do |i|
		b.push(array[i]+array[i-1])	if i > 0
	end
	return b.unshift(1).push(1)
end

def pasc_tri_v2(n)
	pt = b = [[1]]
	n.times do
		next_array = array_transform(b)
		pt.push(next_array)
		b = next_array
	end
	return pt
end

def pt_nth_row_v2(n)
	pasc_tri_v2(n).last.uniq
end



# First solution

def build_new_array_from(array)
	b = []

	array.each_index do |i|
		b.push(array[i]+array[i-1])
		if i == 0
			b.push(array[i])
		elsif i == array.length - 1
			b.push(array[i])
		end
	end
	b.shift
	return b
end

def pasc_tri_v1(n)
	first = [1]
	second = [1,1]

	if n == 1
		puts "1"
	elsif n == 2
		puts "1"
		puts "1 1"
	else
		puts first
		puts second.join(" ")
		a = second
		(n-2).times do
			b = build_new_array_from(a)
			puts b.join(" ")
			a = b
		end
	end
	return a
end

def pt_nth_row_v1(n)
	pasc_tri_v1(n).uniq
end

binding.pry