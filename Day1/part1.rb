# frozen_string_literal: true

def another
  input_lines = File.readlines("Day1/input.txt")
  calories_per_elf = input_lines.map(&:to_i).slice_before(&:zero?).map(&:sum)

  # part 1
  pp calories_per_elf.max

  # part 2
  pp calories_per_elf.sort.last(3).sum
end

another