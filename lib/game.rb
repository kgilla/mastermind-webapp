require_relative "guess"

class Game
  attr_reader :secret_key, :round_count, :end_message
  
  def initialize
    @secret_key = generate_key()
    @round_count = 0
    @end_message = ""
  end

  colors = {
    :red => " #c0392b ",
    :green => " #27ae60 ",
    :blue => " #3498db ",
    :yellow =>
    :orange =>
    :purple =>
  }

  def generate_key 
    4.times.map do 
      [" #c0392b "," #27ae60 "," #3498db "," #f1c40f "," #e67e22 "," #8e44ad "].sample
    end
  end

  def check_win(guess)
    if guess == @secret_key && @round_count < 12
      winner
    elsif @round_count == 12
      loser
    else
      @round_count += 1
    end
  end

  def winner 
    win = @secret_key.join(", ")
    @end_message = "Congrats! You correctly guessed: #{win}!" 
  end

  def loser
    loss = @secret_key.join(", ")
    @end_message = "Aww shucks! the secret key was #{loss}"
  end
end
  