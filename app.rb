require 'sinatra'
require "sinatra/reloader" if development?

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
  NEWGAME = Game.new(session[:multi_key])
  erb :game
end

get '/multi' do
  erb :multi
end

get '/new_game' do
  session.clear
  session[:guess_list] = []
  session[:key_list] = []
  NEWGAME = Game.new(session[:multi_key])
  erb :game
end

post '/multi' do
  session[:multi_key] = params.values
  redirect '/game'
end

post '/game' do
  @blah = params['Guess!']
  session[:guess_list] << params.values
  @current_guess = Guess.new(session[:guess_list].last)
  session[:key_list] << @current_guess.hint_key
  erb :game
end
