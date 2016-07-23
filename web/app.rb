require 'sinatra' 

require_relative '../lib/gemfile_lookup.rb'

post '/gemfile' do 
  gems = GemfileLookup::GithubCheck.run(params['gemfile'])
  result = GemfileLookup::Parse.run(gems)
  api_return = GemfileLookup::RubyGemsCall.run(result[:gem_list])
  commented_api_return = GemfileLookup::RubyGemsCall.run(result[:commented_gems])
  erb :result, :locals => {gemlist: api_return[:result], commented_gems: commented_api_return[:result]}
end

get '/' do 
  erb :index
end