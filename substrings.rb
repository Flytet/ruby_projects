def substrings(word, substrings)
  puts "Too few substrings" if substrings.length == 0
  word.downcase!
  list = Hash.new
  substrings.each do |w|
    if /#{w}/ =~ word
      list[w] = word.scan(/(#{w})/).count
    end
  end
  return list
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)