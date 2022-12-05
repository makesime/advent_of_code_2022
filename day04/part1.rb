#  Every section has a unique ID number, and each Elf is assigned a range of section IDs.
# big list of the section assignments for each pair (your puzzle input).

# Within the first pair of Elves, the first Elf was assigned sections 2-4 (sections 2, 3, and 4), while the second Elf was assigned sections 6-8 (sections 6, 7, 8).
# The Elves in the second pair were each assigned two sections.
# The Elves in the third pair were each assigned three sections: one got sections 5, 6, and 7, while the other also got 7, plus 8 and 9.

# In how many assignment pairs does one range fully contain the other?

# input = File.readlines("day04/test_input.txt")
input = File.readlines("day04/input.txt")

# def ranges_overlap?(range_a, range_b)
#   range_b.begin <= range_a.end && range_a.begin <= range_b.end
# end

pairs = input.map{|i| i.delete("\r\n\\").split(',')}

duplicated_assignment_pairs = 0
pairs.each do |pair|
  limits1 = pair[0].split('-').map(&:to_i)
  range_1 = limits1[0]..limits1[-1]

  limits2 = pair[-1].split('-').map(&:to_i)
  range_2 = limits2[0]..limits2[-1]
  duplicated_assignment_pairs += 1 if (range_1).cover?(range_2) || (range_2).cover?(range_1)
end

puts "There are #{duplicated_assignment_pairs} assignment pairs that fully contain the other"