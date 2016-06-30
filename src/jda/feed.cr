require "csv"

module JDA
  class Feed
    class NoSrcError < ArgumentError; end

    @data : Array(Array(String))?

    def initialize(@src : String?)
      @src || raise NoSrcError.new("missing path to CSV source")
    end

    def read
      @data ||= File.open(@src.as(String)) { |f| CSV.parse(f) }
    end

    def data
      @data.as(Array(Array(String)))
    end
  end
end
