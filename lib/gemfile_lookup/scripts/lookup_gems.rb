require 'open-uri'
require 'json'

#gets an array of hashes with gem name and version number or possibly just a sub array. 
#returns an array of hashes with all of the different information about each gem

module GemfileLookup
  class RubyGemsCall
    def self.run(gem_list)
      api_result = []
      gem_list.each do |gem_name|
        gem_info = open("https://rubygems.org/api/v1/gems/#{gem_name}.json").read
        gem_info_parsed = JSON.parse(gem_info)
        api_result.push(gem_info_parsed)
      end
      return { success?: true, result: api_result }
    end
  end
end