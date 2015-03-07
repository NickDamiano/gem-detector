module GemfileLookup
  class Parse
    def self.run(source_file)
      result = []
      commented_gems = []
      parsed_file = source_file.gsub(/\r/, '').split(/\n/)
      parsed_file.each do |line|
        if line.lstrip.start_with?('Gem ', 'gem ', 'GEM ')
          if line =~ /\sif\s/
            gem_and_version = line.lstrip[4..-1].split('if')
          else
            gem_and_version =  line.lstrip[4..-1].split(',')
          end

          gem_name = gem_and_version[0]
          result.push(gem_name.to_s) unless gem_name.empty?
        end

        line = line.lstrip.downcase
        if line =~ /#\s*gem\s/
          #get rid of the # and then strip any white space. then start the index from 1
          line = line[1..-1].lstrip
          gem_and_version =  line[4..-1].split(',')
          gem_name = gem_and_version[0][1...-1]
          commented_gems.push(gem_name.to_s) unless gem_name.empty?
        end
      end

      result = result.map{ |gemname| gemname[1...-1] }

      if result.size == 0
        return { success?: false, gem_list: [], commented_gems: [] }
      else
        return { success?: true, gem_list: result, commented_gems: commented_gems }
      end
    end
  end
end
