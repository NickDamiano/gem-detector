require 'sinatra' 

require_relative '../lib/gemfile_lookup.rb'

set :bind, '0.0.0.0' #vagrant stuff

post '/gemfile' do 
  gems = params['gemfile']
  GemfileLookup::Parse.run(gems)
  erb :result, :locals => {gemlist: gems}
end

get '/gemfile' do 
  
end

get '/' do 
  erb :index
end