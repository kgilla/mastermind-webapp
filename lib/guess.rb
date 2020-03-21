require_relative "game"

class Guess
  attr_reader :hint_key, :temp_key, :current_guess

  def initialize(guess)
    @current_guess = guess.slice(0..3)
    @temp_key = GAME.secret_key.slice(0..3)
    @hint_key = get_hint_key
  end

  def get_hint_key
    key_array = []
    guess_copy = @current_guess.dup
    key_copy = @temp_key.dup

    guess_copy.each_with_index do |val, i|
      if guess_copy[i] == key_copy[i]
        key_copy[i] = nil
        guess_copy[i] = nil 
        key_array << "red"
      end
    end 

    guess_copy.each_with_index do |guess, i|
      key_copy.each_with_index do |key, t|
        if guess_copy[i] == key_copy[t] && !guess_copy[i] == key_copy[t]
          guess_copy[i] = nil
          temp_key[t] = nil
          key_array << "white"
        end
      end
    end
    
    key_array << "black" until key_array.length == 4
    key_array
  end
end

