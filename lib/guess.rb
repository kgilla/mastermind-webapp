require_relative "game"

class Guess
  attr_reader :current_guess, :temp_key, :hint_key

  def initialize
    @current_guess = session[:guess_list].last
    @temp_key = @secret_key
    # @hint_key = get_hint_key
  end
end
#   def get_hint_key
#     correct = show_correct
#     hints = show_hints
#     hint_array = make_hint_array(correct, hints)
#     session[:key_list] << hint_array
#   end 

#   def show_correct 
#     correct = 0
#     @current_guess.each_with_index do |val, i|
#       if @current_guess[i] == @temp_key[i]
#         @temp_key[i] = nil 
#         correct += 1
#       end
#     end 
#     correct
#   end

#   def show_hints
#     hints = 0
#     @current_guess.each do |guess|
#       hints += 1 if @temp_key.include?(guess)
#     end
#     hints
#   end
  
#   def make_hint_array (correct, hints)
#     hint_array = []
#     correct.times {hint_array.unshift("red")}
#     hints.times {hint_array.unshift("white")}
#     while hint_array.length < 4
#       hint_array.push("black")
#     end
#     hint_array
#   end 
# end
