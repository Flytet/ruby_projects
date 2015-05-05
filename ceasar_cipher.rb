def ceasar_cipher(string, shift = 0)
	letters = ('a'..'z').to_a.concat(('A'..'Z').to_a)
	output_string = ""
	string.each_char do |char|
		if letters.include?(char)
			output_string += letters[letters.index(char) - shift]
		else
			output_string += char
		end
	end
	return output_string
end

puts "Enter a string"
string = gets.chomp
puts "Enter a shift int"
shift = gets.chomp.to_i
puts ceasar_cipher(string, shift)