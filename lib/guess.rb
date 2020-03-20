class Guess
  def get_guess 
    
  end
  
  def show_correct (current_guess, temp_key)
    correct_count = 0; 
    for i in 0..3
      if current_guess[i] == temp_key[i]
        temp_key[i] = "F"
        correct_count += 1
      end
    end 
    hint_count = show_hints(current_guess, temp_key)
    return correct_count, hint_count
  end
  
  def show_hints (current_guess, temp_key)
    hint_count = 0 
    for i in 0..3
      for t in 0..3
        if temp_key[i] == current_guess[t]
          hint_count += 1
          temp_key[i] = "F"
        end
      end
    end
    return hint_count
  end
  
  def make_hint_array (correct_hint)
    hint_array = []
    correct_hint[0].to_i.times {hint_array.unshift("B")}
    correct_hint[1].to_i.times {hint_array.unshift("W")}
    while hint_array.length < 4
      hint_array.push("*")
    end
    return hint_array
  end 
  
  def make_arr (hint_array, current_guess)
    single_round = hint_array + current_guess
    return single_round
  end

  def check_winner(single_round, new_game)
    hint_count = 0
    single_round.each do |hint|
      if hint == "B"
        hint_count += 1
        if hint_count == 4
          win = true
          game_over(win, new_game)
        end
      end
    end
  end
end
