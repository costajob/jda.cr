require "colorize"

module JDA
  class Report
    def initialize(@name : String, @records : Array(Array(String)))
    end

    def render(io : IO)
      io.puts header
    end

    private def header
      String.build do |str|
        str << @name.colorize(:yellow).bold
        str << " - matchings: "
        str << @records.size.to_s.colorize(:cyan).bold
      end
    end
  end
end
