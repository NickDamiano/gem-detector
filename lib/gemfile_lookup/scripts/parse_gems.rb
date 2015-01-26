#gets the gemfile and regexes it to return an array of hashes with gem name and gem version

module GemfileLookup
  class Parse
    def self.run(gemfile)
      p gemfile 
      #data comes in like this source 
      #'https://rubygems.org'\r\n\r\ngem 'rspec',
      # '~> 2.14.1'\r\ngem 'pry-byebug'\r\ngem 'sinatra', require: 'sinatra/base'\r\ngem 
      #'sinatra-contrib', require: 'sinatra/reloader'\r\ngem 'roo', '~> 1.13.2'\r\ngem 
      #'google-spreadsheet-ruby', '~> 0.3.1'\r\ngem 'pg'\r\ngem 'activerecord', '~> 4.1.0'
      #\r\ngem 'active_record_tasks', '~> 1.1.0'"
      #TODO write regex for split method so that each line is in an array
      #after array, map it out so you pull out only the lines that say gem, though maybe I need to have 
      #whether it's production or test? maybe that's a stretch goal. 
      #return hash success/fail and data/array? of gems used and their version, 
      #it's more complicated when they require specific parts of it like sinatra/reloader
      #start with just basic gem file
      #return array should be like [{'rspec': 2.14.1}, {'pry-byebug': nil}]
      #or maybe it's an array and it detects if it's one element it's just the latest gem, if it's two, it's the latest
      #gem and version, and if it's 3, it's the gem, version, and specific gem within that thing?
      #TODO figure out data structure
    end
  end
end
