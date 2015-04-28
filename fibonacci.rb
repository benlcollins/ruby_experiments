require 'pry'

def sequence(n)
	array = [0,1]

	n.times{ |i| array.push(array[i+1] + array[i]) }
	
	puts array
end

binding.pry