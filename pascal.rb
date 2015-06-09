# Pascal Triangle Challenge

require 'pry'

# Q1. write a method that will return Pascal's triangle up to n rows, e.g.
#       1
#      1 1
#     1 2 1
#    1 3 3 1
#   1 4 6 4 1
# 1 5 10 10 5 1

# Q2. write a method to return an array of the numbers 
# in the n-th row of a pascal triangle
# e.g. for n = 5 output should be [1,5,10]

# Some solutions/discussions online:
# http://rubyquiz.com/quiz84.html
# http://stackoverflow.com/questions/19205195/pascals-triangle-in-ruby

# Step 1: Mess about with manual method

a = [1,3,3,1]
b = []

b.push(1)
b.push(a[0]+a[1])
b.push(a[1]+a[2])
b.push(a[2]+a[3])
b.push(1)

puts "Manual method:"
puts b
puts ""


# Step 2: change to loop

c = []

a.each_index do |i| 
	if i > 0
		c.push(a[i] + a[i-1])
	end
end

puts "Loop method:"
puts c.push(1).unshift(1)
puts ""


# Step 3: turn into method with array as argument

def pascal(array)
	d = [1]

	array.each_index do |i| 
		if i > 0
			d.push(array[i] + array[i-1])
		end
	end
	return d.push(1)
end


# Step 4: My first solution

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



# Step 5: My second solution with refactored code

def array_transform(array)
	b = []
	array.each_index do |i|
		b.push(array[i]+array[i-1])	if i > 0
	end
	return b.unshift(1).push(1)
end

def pasc_tri_v2(n)
	pt = [[1]]
	b = pt
	(n-1).times do
		next_array = array_transform(b)
		pt.push(next_array)
		b = next_array
	end
	return pt
end

def pt_nth_row_v2(n)
	pasc_tri_v2(n).last
end


# Step 6: Print out the triangle in Pry, with correct spacing
# This is still a work in progress!!!

def print_pt(n)
	max_num = pt_nth_row_v2(n).sort.last.to_s.size
	l = 0
	pt_nth_row_v2(n).each do |int|
		l += int.to_s.size + max_num
	end
	n.times do |i|
		puts pt_nth_row_v2(i).join(" "*max_num).center(l) if i > 0
	end
end


binding.pry