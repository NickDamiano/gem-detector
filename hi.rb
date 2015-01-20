require 'sinatra' 

set :bind, '0.0.0.0' #vagrant stuff

get '/hi' do 
  'hello world'
end

get '/' do 
  erb :index
end