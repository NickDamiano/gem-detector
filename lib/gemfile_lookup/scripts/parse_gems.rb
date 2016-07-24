module GemfileLookup
  class Parse
    def self.run(source_file)
      result = []
      commented_gems = []
      parsed_file = source_file.gsub(/\r/, '').split(/\n/)
      parsed_file.each do |line|
        line = line.lstrip.downcase
        if line.start_with?('gem ')
          # splits the gem name from anything that follows it
          gem_name = parse_out_gemname(line)
          # pushes the gem into the array of gems
          result.push(gem_name) unless gem_name.nil? || gem_name.empty?
        end

        if line =~ /#\s*gem\s/
          line = line[1..-1].lstrip
          gem_name = parse_out_gemname(line)
          commented_gems.push(gem_name) unless gem_name.empty?
        end
      end

      if result.size == 0
        return { success?: false, gem_list: [], commented_gems: [] }
      else
        return { success?: true, gem_list: result, commented_gems: commented_gems }
      end
    end

    # version is parsed in case we want to add future upgrade that gets current dependencies 
    #  based off of version. I know, I know. YAGNI...
    def self.parse_out_gemname(line)
      gem_and_version =  line[4..-1].split(',')
      gem_name = gem_and_version[0].split(/\'|\"/)[1]
    end
  end
end
