require_relative "guess"

class Game
  attr_reader :secret_key, :round_count, :message, :colors, :color_key
  
  def initialize (key)
    @colors = {
      :red =>  "#d32f2f" ,
      :green => "#388e3c",
      :blue => "#1976d2",
      :yellow => "#fdd835",
      :orange => "#e64a19",
      :purple => "#7b1fa2"
    }
    @secret_key = key ? key : generate_key
    @color_key = generate_color_key
    @round_count = 1
    @message = "Go ahead and make a guess!"
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
      winner
    elsif @round_count > 12
      loser
    else
      @round_count += 1
      @message = message_maker
    end
  end

  def winner 
    @message = "Congrats! You correctly guessed: #{@color_key}!" 
  end

  def loser
    @message = "Aww shucks! the secret key was #{@color_key}"
  end

  def message_maker
    collection = ["I'm pretty sure there is a purple somewhere!", "You call that a guess?! Bwahahahaha", "I've seen better guesses from a mere baby!", "Are you even trying to win?"]
    message = collection.sample(1).join("")
  end
end
  