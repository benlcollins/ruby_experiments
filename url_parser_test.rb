require 'pry'
require 'uri'

puts "Enter link"
l = gets.chomp

def url_checker(link)
	u = URI(link)
	if (!u.scheme)
		u = "http://#{u}"
	elsif (%w{http https}.include?(u.scheme))
		#everything ok
	else
		#error message?
	end
	return u
end

puts url_checker(l)

# binding.pry
