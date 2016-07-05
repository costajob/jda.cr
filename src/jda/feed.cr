require "csv"

module JDA
  class Feed
    VALID_EXTENSIONS = {".txt"}

    class NoSrcError < ArgumentError; end

    def self.ext_pattern
      String.build do |str|
        str << "*{"
        str << VALID_EXTENSIONS.join(",")
        str << "}"
      end
    end

    def initialize(@src : String?)
      raise NoSrcError.new("missing path to feed") unless @src
    end

    def each_row
      File.open(@src.as(String)) do |f| 
        CSV.new(f) do |csv|
          yield(csv.row.to_a)
        end
      end
    end

    def name
      File.basename(@src.as(String))
    end
  end
end
