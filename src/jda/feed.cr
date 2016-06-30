require "csv"

module JDA
  class Feed
    VALID_EXTENSIONS = %w(.txt)

    class NoSrcError < ArgumentError; end

    def self.ext_pattern
      String.build do |str|
        str << "*{"
        str << VALID_EXTENSIONS.join(",")
        str << "}"
      end
    end

    @data : Array(Array(String))?

    def initialize(@src : String?)
      raise NoSrcError.new("missing path to feed") unless @src
    end

    def read
      @data ||= File.open(@src.as(String)) { |f| CSV.parse(f) }
    end

    def data
      @data.as(Array(Array(String)))
    end

    def name
      File.basename(@src.as(String))
    end
  end
end
