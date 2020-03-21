require 'sinatra'

require_relative './lib/game'
require_relative './lib/guess'

enable :sessions

get '/' do 
  session.clear
  erb :index
end

get '/game' do
  session[:guess_list] = []
  session[:key_list] = []
  GAME = Game.new
  erb :game
end

post '/game' do
  session[:guess_list] << params.values
  @current_guess = Guess.new
  erb :game
end
