require 'open-uri'
require 'json'
#TODO 
#gets an array of hashes with gem name and version number or possibly just a sub array. 
#returns an array of hashes with all of the different information about each gem
#api call gets gem information
#gem information is stored in hash
#hash is pushed into array
#repeated

module GemfileLookup
  class RubyGemsCall
    def self.run(gem_list)
      api_result = []
      p 'GEM LIST BELOW'
      p gem_list
      gem_list.each do |gem_name|
        gem_info = open("https://rubygems.org/api/v1/gems/#{gem_name}.json").read
        gem_info_parsed = JSON.parse(gem_info)
        api_result.push(gem_info_parsed)
      end
      return { success?: true, result: api_result }
    end
  end
end