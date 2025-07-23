require_relative 'player'
require_relative 'question'

P1 = Player.new
P2 = Player.new
players = [P1, P2]

index = 0
loop do
  current_player = players[index]
  the_other_player = players[(index + 1) % 2]

  if index == 0
    current_player_display = "Player 1"
    the_other_player_display = "Player 2"
  else
    current_player_display = "Player 2"
    the_other_player_display = "Player 1"
  end
  

  question = Question.new
  puts "#{current_player_display}: What does #{question.num_1} plus #{question.num_2} equal?"

  current_player.answer = gets.chomp.to_i

  if current_player.answer == question.sum
    puts "YES! You are correct."
  else 
    current_player.life -= 1
    puts "Seriously? NO!"
  end

  puts "P1: #{P1.life}/3 vs #{P2.life}/3"

  if current_player.life == 0
    puts "#{the_other_player_display} wins the game with a score of #{the_other_player.life}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
    break
  else
    puts "----- NEW TURN -----"
  end
  
  index = (index + 1) % 2
end
