require "pry"

class LogParser
  attr_accessor :file
  attr_accessor :results

  def initialize(file)
    self.file = file

    self.results = []
  end

  def parse
    file.each_line do |line|
      url, _ = line.split(" ")

      exists = results.collect do |result|
        if result[:url] == url
          result[:total] +=1
        end
      end.compact!
      if exists.nil? || exists.empty?
        results << {url: url, total: 1}
      end
    end
  end
end
