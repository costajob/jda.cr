require "./filters.cr"
require "./feed.cr"

module JDA
  class Scanner
    DEFAULT_PATH = File.expand_path("../../samples")

    def initialize(@filters : Array(Feeds::Base), @feeds_path = DEFAULT_PATH)
    end

    private def feeds
      Dir.entries(@feeds_path).map { |src| Feed.new(src) }
    end
  end
end
