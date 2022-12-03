# input = File.readlines("day03/day03_test_input.txt")
input = File.readlines("day03/day03_input.txt")

duplicated_items = []
input.each do |i|
  current_match = 0
  first, second = i.chars.each_slice(i.length / 2).map(&:join)
  first.split('').each do |char|
    if second.include?(char)
      current_match += 1
      next unless current_match <= 1

      duplicated_items << char if second.include?(char)
    end

  end
end

modifier = 0
values = {}
[*('a'..'z'), *('A'..'Z')].each do |letter|
  modifier += 1
  values[letter] = modifier
end

puts "Sum of all duplicated items is: #{duplicated_items.map{ |o| values[o] }.sum}"


