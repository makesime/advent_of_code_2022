# frozen_string_literal: true

# A for Rock, B for Paper, and C for Scissors
# X for Rock, Y for Paper, and Z for Scissors
# Your total score is the sum of your scores for each round
# (1 for Rock, 2 for Paper, and 3 for Scissors)
# plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).
#
# In the first round, your opponent will choose Rock (A), and you should choose Paper (Y). This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
# In the second round, your opponent will choose Paper (B), and you should choose Rock (X). This ends in a loss for you with a score of 1 (1 + 0).
# The third round is a draw with both players choosing Scissors, giving you a score of 3 + 3 = 6.
# In this example, if you were to follow the strategy guide, you would get a total score of 15 (8 + 1 + 6).

mapping = {
  "A" => 1, # Rock
  "B" => 2, # paper
  "C" => 3, # scissors
  "X" => 1, # rock
  "Y" => 2, # paper
  "Z" => 3 # scissors
}

outcome = {
  "A X" => :draw,
  "A Y" => :win,
  "A Z" => :loss,
  "B X" => :loss,
  "B Y" => :draw,
  "B Z" => :win,
  "C X" => :win,
  "C Y" => :loss,
  "C Z" => :draw
}

input = File.readlines("day02/day2_input.txt")
rounds = input.map{|i| i.split("\n")}.flatten

score = 0
rounds.each do|round|
  player_score = mapping[round[2]]
  game_result = outcome[round]

  case game_result
  when :draw then score += (3 + player_score)
  when :win then score += (6 + player_score)
  when :loss then score += player_score
  else pp "No result for #{round}"
  end
end

pp "Final Score"
pp score





