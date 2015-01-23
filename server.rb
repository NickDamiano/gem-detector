require 'sinatra' 

set :bind, '0.0.0.0' #vagrant stuff

post '/gemfile' do 
  puts params
  erb :gemlist, :locals => {test: params['gemfile']}
end

# get '/gemfile' do 

# end

get '/' do 
  erb :index
end