input = File.readlines("day04/input.txt")
# input = File.readlines("day04/test_input.txt")

pairs = input.map{|i| i.delete("\r\n\\").split(',')}

overlapping_assignment_pairs = 0
pairs.each do |pair|
  limits1 = pair[0].split('-').map(&:to_i)
  range_a = [*(limits1[0]..limits1[-1])]

  limits2 = pair[-1].split('-').map(&:to_i)
  range_b = [*(limits2[0]..limits2[-1])]

  overlapping_assignment_pairs += 1 if (range_a & range_b).any?
end

puts "The number of overlapping assignment pairs is: #{overlapping_assignment_pairs}"