require 'open-uri'
require 'json'
require "resolv-replace.rb"

#gets an array of hashes with gem name and version number or possibly just a sub array. 
#returns an array of hashes with all of the different information about each gem

module GemfileLookup
  class RubyGemsCall
    def self.run(gem_list)
      api_result = []
      thread_list = []
      gem_info = 429
      gem_info_parsed = nil
      gem_list.each do |gem_name|
        thread_list << Thread.new do 
          # call the method to get the gem data
            # in that method, if the result is 429 have it return 429, otherwise if error have it put not found
            # here if the error is 429, going into a loop calling the method until the error is no longer 429 or time
            while(gem_info == 429)
              gem_info = call_api(gem_name)
            end
            # if it's an integer it's an error code, gem wasn't found
            if gem_info.is_a? String 
              gem_info_parsed = JSON.parse(gem_info) unless gem_info.nil?
              api_result.push(gem_info_parsed) unless gem_info_parsed.nil?
            else
              api_result.push({"name" => gem_name, "info" => "Gem not found at rubygems.org"})
            end
        end
      end
      thread_list.each { |thread| thread.join }
      api_result = api_result.sort_by { |item| item["name"] }
      api_result = api_result.uniq
      api_result.each { |gem_name| gem_name['downloads'] = convertWithCommas(gem_name['downloads'])}
      { success?: true, result: api_result }
    end

    def self.convertWithCommas(number)
      number.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
    end

    def self.call_api(gem_name)
      begin
        gem_info = open("https://rubygems.org/api/v1/gems/#{gem_name}.json").read
      rescue OpenURI::HTTPError => e 
        return Integer(e.io.status[0])
      end
      gem_info
    end
  end
end
