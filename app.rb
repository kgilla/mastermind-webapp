require 'sinatra'
require "sinatra/reloader" if development?

require_relative './lib/game'
require_relative './lib/guess'

enable :sessions

get '/' do
  game = Game.new(session[:multi_key])
  session[:game] = game
  session[:guess_list] = []
  session[:key_list] = []
  erb :game
end

post '/' do
  current_guess = Guess.new(params.values, session[:game])
  session[:guess_list] << params.values
  session[:key_list] << current_guess.hint_key
  erb :game
end

get "/newgame" do
  session.clear
  redirect "/"
end

get '/multi' do
  session.clear
  game = Game.new()
  erb :multi, locals: {game: game}
end

post '/multi' do
  session[:multi_key] = params.values
  redirect '/'
end

get "/rules" do
  erb :rules
end


