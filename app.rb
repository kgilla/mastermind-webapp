require 'sinatra'
# require "sinatra/reloader" if development?

require_relative './lib/game'
require_relative './lib/guess'

enable :sessions

get '/' do
  session[:guess_list] = []
  session[:key_list] = []
  GAME = Game.new(session[:multi_key])
  erb :game
end

post '/' do
  current_guess = Guess.new(params.values)
  session[:guess_list] << params.values
  session[:key_list] << current_guess.hint_key
  erb :game
end

get "/newgame" do
  session.clear
  redirect "/"
end

get '/multi' do
  erb :multi
end

post '/multi' do
  session[:multi_key] = params.values
  redirect '/'
end

get "/rules" do
  erb :rules
end


