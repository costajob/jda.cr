require "colorize"

module JDA
  class Report
    def initialize(@records : Hash(String, Array(Array(String))))
    end

    def render(io = STDOUT)
      @records.each do |feed, data|
        io.puts header(feed, data.size)
      end
    end

    private def header(feed, size)
      String.build do |str|
        str << feed.colorize(:yellow).bold
        str << " - matchings: "
        str << size.to_s.colorize(:cyan).bold
      end
    end
  end
end
