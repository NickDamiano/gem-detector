require 'sinatra' 

set :bind, '0.0.0.0' #vagrant stuff

post '/gemfile' do 
end

get '/gemfile' do 
end

get '/' do 
  erb :test
end