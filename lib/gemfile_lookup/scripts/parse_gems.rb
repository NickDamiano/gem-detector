#gets the gemfile and regexes it to return an array of hashes with gem name and gem version
#TODO
#write better method description - refactor code - 
#change it so it parses when gem is indented as it is
#when listed under groups for dev, test, production. Right
#now it's missing all of those. maybe left strip any whitespace.
module GemfileLookup
  class Parse
    def self.run(gemfile)
      result = []
      source_file = gemfile
      parsed_file = source_file.gsub(/\r/, '').split(/\n/)
      parsed_file.each do |line|
        if line.start_with?('Gem', 'gem', 'GEM')
          gem_name = line[/'+\w+'/].to_s
          result.push(gem_name.to_s) unless gem_name.empty?
        end
      end
      result = result.map{ |gemname| gemname[1...-1] }
      p result
      if result.size == 0
        return {success?: false, gems: []}
      else
        return {success?: true, gem_list: result}
      end
    end
  end
end
