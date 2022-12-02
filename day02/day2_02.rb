# frozen_string_literal: true

values = { rock: 1, paper: 2, scissors: 3 }
desired_outcomes = { "X" => :lose, "Y" => :draw, "Z" => :win }
player_choices = {
  lose: { "A" => :scissors, "B" => :rock, "C" => :paper },
  draw: { "A" => :rock, "B" => :paper, "C" => :scissors },
  win: { "A" => :paper, "B" => :scissors, "C" => :rock }
}

input = File.readlines("day02/day2_input.txt")
rounds = input.map{|i| i.split("\n")}.flatten

score = 0
rounds.each do|round|
  outcome = desired_outcomes[round[2].chr]
  player_choice = player_choices[outcome][round[0].chr]

  case outcome
  when :draw then score += (3 + values[player_choice])
  when :win then score += (6 + values[player_choice])
  when :lose then score += values[player_choice]
  else pp "No result for #{round}"
  end
end

pp "Final Score"
pp score





