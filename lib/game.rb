require_relative "guess"

class Game
  attr_reader :secret_key, :round_count, :message, :colors, :color_key
  
  def initialize (key)
    @colors = {
      :Red =>  "#d32f2f",
      :Green => "#388e3c",
      :Blue => "#1976d2",
      :Yellow => "#fbc02d",
      :Orange => "#e64a19",
      :Purple => "#7b1fa2"
    }
    @secret_key = key ? key : generate_key
    @color_key = generate_color_key
    @round_count = 1
    @message = ""
  end

  def generate_color_key 
    array = []
    @secret_key.each do |value|
      @colors.each_pair do |k, v|
        array << k if value == v 
      end
    end
    array.join(", ")
  end

  def generate_key 
    @colors.values.sample(4)
  end

  def check_win(guess)
    if guess == @secret_key 
      end_round(TRUE)
    elsif @round_count == 10
    end_round(FALSE)
    else
      @round_count += 1
    end
  end

  def end_round(win)
    if win ?
      @message = {
        :title => "Winner!",
        :body => "Congratulations! You correctly guessed: #{@color_key}"
      }
      : @message = {
        :title => "Game Over",
        :body => "Aww shucks! the secret key was #{@color_key}" 
      }
    end
    puts @message
  end
end
  