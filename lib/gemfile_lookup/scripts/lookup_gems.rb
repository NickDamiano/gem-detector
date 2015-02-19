require 'open-uri'
require 'json'
require "resolv-replace.rb"

#gets an array of hashes with gem name and version number or possibly just a sub array. 
#returns an array of hashes with all of the different information about each gem

module GemfileLookup
  class RubyGemsCall
    def self.run(gem_list)
      api_result = []
      gem_list.each do |gem_name|
        begin
          gem_info = open("https://rubygems.org/api/v1/gems/#{gem_name}.json").read
          rescue OpenURI::HTTPError 
            api_result.push({"name" => gem_name, "info" => "Gem not found at rubygems.org"})
        end
          gem_info_parsed = JSON.parse(gem_info) unless gem_info.nil?
          api_result.push(gem_info_parsed) unless gem_info_parsed.nil?


      end
      return { success?: true, result: api_result }
    end
  end
end