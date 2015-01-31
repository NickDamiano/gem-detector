require 'sinatra' 

require_relative '../lib/gemfile_lookup.rb'

set :bind, '0.0.0.0' #vagrant stuff

post '/gemfile' do 
  gems = params['gemfile']
  result = GemfileLookup::Parse.run(gems)
  api_return = GemfileLookup::RubyGemsCall.run(result[:gem_list])
  erb :result, :locals => {gemlist: api_return[:result]}
end

get '/gemfile' do 
  
end

get '/' do 
  erb :index
end