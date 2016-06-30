require "csv"

module JDA
  class Feed
    VALID_EXTENSIONS = %w(.txt)

    class NoSrcError < ArgumentError; end
    class InvalidExtError < ArgumentError; end

    @data : Array(Array(String))?

    def initialize(@src : String?)
      check_src
    end

    def read
      @data ||= File.open(@src.as(String)) { |f| CSV.parse(f) }
    end

    def data
      @data.as(Array(Array(String)))
    end

    private def check_src
      raise NoSrcError.new("missing path to feed") unless @src
      raise InvalidExtError.new("invalid feed extension, supported are: #{VALID_EXTENSIONS.join(", ")}") unless valid_ext?
    end

    private def ext
      File.extname(@src.as(String))
    end

    private def valid_ext?
      VALID_EXTENSIONS.includes?(ext)
    end
  end
end
