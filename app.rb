require 'sinatra'
# require 'active-reload'

get '/' do 
  erb :index
end


# class PlayerGuess
#   attr_accessor :secret_key, :rounds_total, :round_count
  
#   def initialize
#     @secret_key = generate_key()
#     @rounds_total = []
#     @round_count = 0
#   end

#   def round_data (new_game)
#     temp_key = new_game.secret_key.slice(0, 4)
#     current_guess = get_guess()
#     correct_hint = show_correct(current_guess, temp_key)
#     hint_array = make_hint_array(correct_hint)
#     single_round = make_arr(hint_array, current_guess)
#     return single_round
#   end

#   def generate_key 
#     array = []
#     4.times {array.push(rand(1...6).to_s)}
#     return array
#   end
  
#   def get_guess 
#     puts " "
#     puts "\n Guess what the key is by giving four numbers 1 - 6!"
#     guess = gets.chomp.split("")
#     if guess.length != 4
#       puts "FOUR NUMBERS BETWEEN 1-6!"
#       get_guess()
#     end
#     return guess
#   end
  
#   def show_correct (current_guess, temp_key)
#     correct_count = 0; 
#     for i in 0..3
#       if current_guess[i] == temp_key[i]
#         temp_key[i] = "F"
#         correct_count += 1
#       end
#     end 
#     hint_count = show_hints(current_guess, temp_key)
#     return correct_count, hint_count
#   end
  
#   def show_hints (current_guess, temp_key)
#     hint_count = 0 
#     for i in 0..3
#       for t in 0..3
#         if temp_key[i] == current_guess[t]
#           hint_count += 1
#           temp_key[i] = "F"
#         end
#       end
#     end
#     return hint_count
#   end
  
#   def make_hint_array (correct_hint)
#     hint_array = []
#     correct_hint[0].to_i.times {hint_array.unshift("B")}
#     correct_hint[1].to_i.times {hint_array.unshift("W")}
#     while hint_array.length < 4
#       hint_array.push("*")
#     end
#     return hint_array
#   end 
  
#   def make_arr (hint_array, current_guess)
#     single_round = hint_array + current_guess
#     return single_round
#   end

#   def check_winner(single_round, new_game)
#     hint_count = 0
#     single_round.each do |hint|
#       if hint == "B"
#         hint_count += 1
#         if hint_count == 4
#           win = true
#           game_over(win, new_game)
#         end
#       end
#     end
#   end

#   def game_over (win = false, new_game)
#     secret_key = new_game.secret_key.join("|")
#     if win == true
#       puts "\nCongratulations! You are a true Mastermind!"
#       puts "\nYou successfully guessed the code was: #{secret_key}!"
#       play_again()
#     else
#       puts "\nLooks like you lost..... Bummer :("
#       puts "\nThe secret code was: #{secret_key}"
#       play_again()
#     end
#   end
# end

# def intro
#   2.times {puts "#"*80}
#   puts "#"*20 + " "*40 + "#"*20 
#   puts "#"*20 + " "*9 + "Welcome To Mastermind!" + " "*9 + "#"*20
#   puts "#"*20 + " "*40 + "#"*20 
#   2.times {puts "#"*80}
#   title_screen()
# end

# def title_screen
#   puts "\nChoose A Mode!"
#   puts "1) Computer is the Code Maker"
#   puts "2) You are the Code Maker"
#   puts "3) Rules"
#   puts "4) Quit Game"
#   answer = gets.chomp
#   if answer == "1"
#     player_guess_ng()
#   elsif answer == "2"
#     puts "not yet done"
#   elsif answer == "3"
#     show_rules()
#   else
#     exit
#   end
# end

# def play_again
#   puts "\nWant to play again? (Y/N)"
#   answer = gets.chomp.upcase
#   if answer.length != 1
#     play_again()
#   end
#   if answer == "Y"
#     player_guess_ng()
#   else 
#     intro()
#     title_screen()
#   end
# end

# def player_guess_ng
#   puts "\n Can you crack the code in time? ....."
#   new_game = PlayerGuess.new
#   while new_game.round_count < 10
#     single_round = new_game.round_data(new_game)
#     new_game.rounds_total.push(single_round)
#     print_row(new_game.rounds_total)
#     new_game.check_winner(single_round, new_game)
#     if new_game.round_count == 9
#       new_game.game_over(new_game)
#     end
#     new_game.round_count += 1
#   end
# end

