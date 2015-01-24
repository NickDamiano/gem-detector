require 'sinatra' 

set :bind, '0.0.0.0' #vagrant stuff

post '/gemfile' do 
  redirect to('/gemfile?name=butthead')
end

get '/gemfile' do 
  puts name
end

get '/' do 
  erb :index
end