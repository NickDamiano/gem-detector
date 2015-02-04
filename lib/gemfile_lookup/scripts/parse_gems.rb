module GemfileLookup
  class Parse
    def self.run(source_file)
      result = []
      parsed_file = source_file.gsub(/\r/, '').split(/\n/)
      parsed_file.each do |line|
        if line.lstrip.start_with?('Gem', 'gem', 'GEM')
          # gem_name = line[/'+\w+'/].to_s
          gem_and_version =  line.lstrip[4..-1].split(',')
          gem_name = gem_and_version[0]
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
