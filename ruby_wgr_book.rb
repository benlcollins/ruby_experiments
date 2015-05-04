require 'pry'

def args(a,b,c="default",*d)
	puts "Arguments:"
	p a, b, c, d
end

# local variables and scope

# str = "Hello"
# abc = str
# str.replace("Goodbye")
# puts str
# puts abc

str = "Hello"
abc = str
str = "Goodbye"
puts str
puts abc


binding.pry