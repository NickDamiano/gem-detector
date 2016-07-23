require 'open-uri'
require 'json'
# require "resolv-replace.rb"


# GithubCheck looks for a line containing the github repo address, if it finds it, it grabs the text from 
#   the raw github file and returns it, otherwise it returns the original text passed in (containing a gemfile)
module GemfileLookup
  class GithubCheck
    def self.run(original_text)
      text_size = original_text.split("\n").size
      # If the 
      if original_text =~ /github/ && text_size == 1
        # splits https://github.com/username/project-title to
        #   ["https:", "", "github.com", "username", "project-title"]
        url_array     = original_text.split('/')
        user_name     = url_array[3]
        project_title = url_array[4]
        gemfile       = open("https://raw.githubusercontent.com/#{user_name}/#{project_title}/master/Gemfile").read
      else
        return original_text
      end
    end
  end
end
