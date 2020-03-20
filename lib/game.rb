require_relative "guess", "game_updater"

class Game
  attr_reader :secret_key, :round_total
  
  def initialize
    @secret_key = generate_key()
    @round_total = 12
  end

  def round_data (new_game)
    temp_key = new_game.secret_key.slice(0, 4)
    current_guess = get_guess()
    correct_hint = show_correct(current_guess, temp_key)
    hint_array = make_hint_array(correct_hint)
    single_round = make_arr(hint_array, current_guess)
    return single_round
  end

  def generate_key 
    array = []
    4.times {array.push(rand(1...6).to_s)}
    return array
  end
  