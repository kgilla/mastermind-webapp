require_relative "guess"

class Game
  attr_reader :secret_key, :round_total, :guess_list
  
  def initialize
    @secret_key = generate_key()
    @round_total = 12
  end

  def generate_key 
    4.times.map do 
      ["red","green","blue","yellow","orange","purple"].sample
    end
  end

  def check_win

  end

  def winner 

  end

  def loser

  end
end
  