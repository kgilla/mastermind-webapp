require 'sinatra'

enable :sessions

list = []

get '/' do 
  list = []
  erb :index
end

get '/game' do
  @session = session
  erb :game
end

post '/game' do
  list << params.values
  erb :game, :locals => { :list => list }
end
