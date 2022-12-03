require_relative 'part1'

# input = File.readlines("day03/day03_test_input.txt")
input = File.readlines("day03/day03_input.txt")

badges =[]
groups = input.each_slice(3).to_a
groups.each_with_index do |group, index|
  chars_in_group2 = group[0].chars.select { |char| group[1].include?(char) }
  badges << chars_in_group2.detect { |char| group[2].include?(char) }
end

puts "Item types that corresponds to the badges: #{badges}"
puts "Sum of the priorities: #{badges.map{ |o| letter_values[o] }.sum}"
