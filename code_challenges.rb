# Practising Ruby code challenges

require 'pry'
require 'prime'

# Rubeque

# Q1
# Lambda
# http://www.rubeque.com/problems/the-lambda-lambda-lambda-fraternity
even_check = lambda { |*arr|  arr.all? { |i| i.even? } } 

# Q2
# Find all of the prime factors for a given number
# http://ruby-doc.org/stdlib-1.9.3/libdoc/prime/rdoc/Prime.html
def prime_factors(num)
  arr = []
	Prime.each(num) { |prime| num % prime == 0 ? arr.push(prime) : false }
  return arr
end
binding.pry
print prime_factors(420)
puts "\n"

# Variant:
def prime_factors2(num)
  result = []
    Prime.prime_division(num).each { |item| result.push(item[0]) }
  return result
end
print prime_factors2(420)
puts "\n"

# Q3



# Code Quizzes
# http://www.codequizzes.com/ruby/intermediate-ruby

# Q1
a = [1, 2, 3]
b = ["a", "b", "c"]

# me:
3.times do |j|
  3.times { |i| print a[j].to_s + b[i] }
end
puts "\n"

# alternative solution:
result = []
a.each do |num|
  b.each { |letter| result.push(num.to_s + letter)}
end
print result.join
puts "\n"


# Q2
# create array [["", "", ""], ["", "", ""], ["", "", ""]]
print [[""]*3]*3
puts "\n"

# Q3
# Use arrays a and b from Q1 above to make [[1, "a"], [2, "b"], [3, "c"]]
r2 = []
3.times { |i| r2.push([a[i],b[i]])}
print r2
puts "\n"

# Ha! There's a very succint way of doing this with .zip
print a.zip(b)
puts "\n"

# Q4
# Convert c = [[1, "a"], [2, "b"], [3, "c"]] to [1, "a", 2, "b", 3, "c"]
c = [[1, "a"], [2, "b"], [3, "c"]]
print c.flatten
puts "\n"

# Q5
# make hash from a and b: {1 => "a", 2 => "b", 3 => "c"}
hash = Hash.new
3.times { |i| hash[a[i]] = b[i] }
puts hash

# this also works on array c = [[1, "a"], [2, "b"], [3, "c"]]
puts c.to_h


# Q6
# Make the following array: ["name: matt occupation: plumber", "name: phil occupation: baker"]
a = [["matt", "plumber"], ["phil", "baker"]]
b = a.map { |person| person.insert(1, " occupation: ").unshift("name: ").join }
print b
puts "\n"

# Q7
# Convert a = [["row", 3], ["your", 1], ["boat", 1]] to ["row", "row", "row", "your", "boat"]
a = [["row", 3], ["your", 1], ["boat", 1]]
array = []

a.each do |arr|
  arr[1].times { |i| array.push(arr[0])}
end
# print array

print a.map { |word, times| [word].cycle(times).to_a }.flatten


# Fizz Buzz
100.times do |i|
	if i % 3 == 0 && i % 5 == 0
		puts "fizzbuzz"
	elsif i % 5 == 0 
		puts "buzz"
	elsif i % 3 == 0
		puts "fizz"
	else 
		puts i
	end
end

# better
1.upto(100) do |i|
	fizz = (i % 3 == 0)
	buzz = (i % 5 == 0)
	puts case 
		when fizz && buzz then 'FizzBuzz'
		when fizz then 'Fizz'
		when buzz then 'Buzz'
		else i
	end
end


# binding.pry

