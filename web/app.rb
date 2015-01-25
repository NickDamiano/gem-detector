require 'sinatra' 

set :bind, '0.0.0.0' #vagrant stuff

post '/gemfile' do 
  gems = params['gemfile']
  erb :result, :locals => {gemlist: gems}
end

get '/gemfile' do 
  
end

get '/' do 
  erb :index
end