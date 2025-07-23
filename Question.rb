class Question
  attr_reader :num_1, :num_2, :sum 
  def initialize
    @num_1 = rand(1..20)
    @num_2 = rand(1..20)
    @sum = num_1 + num_2
  end
end