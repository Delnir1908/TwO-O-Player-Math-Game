class Player
  attr_accessor :life, :answer

  def initialize
    @life = 3
  end
end

class Question
  attr_reader :num_1, :num_2, :sum 
  def initialize
    @num_1 = rand(1..20)
    @num_2 = rand(1..20)
    @sum = num_1 + num_2
  end
end

P1 = Player.new
P2 = Player.new
players = [P1, P2]

index = 0
loop do
  current_player = players[index]

  if index == 0
    player_on_display = "Player 1"
    the_other_player = "Player 2"
  else
    player_on_display = "Player 2"
    the_other_player = "Player 1"
  end
  

  question = Question.new
  puts "#{player_on_display}: What does #{question.num_1} plus #{question.num_2} equal?"

  current_player.answer = gets.chomp.to_i

  if current_player.answer == question.sum
    puts "YES! You are correct."
  else 
    current_player.life -= 1
    puts "Seriously? NO!"
  end

  puts "P1: #{P1.life}/3 vs #{P2.life}/3"

  if current_player.life == 0
    puts "#{the_other_player} wins the game"
    puts "----- GAME OVER -----"
    puts "Good bye!"
    break
  else
    puts "----- NEW TURN -----"
  end
  
  index = (index + 1) % 2
end
