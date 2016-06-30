require "./filters.cr"
require "./feed.cr"

module JDA
  class Scanner
    DEFAULT_PATH = File.expand_path("../../../samples", __FILE__)

    getter :results

    def initialize(@filters : Array(Filters::Base), @feeds_path = DEFAULT_PATH)
      @results = Hash(String, Array(Array(String))).new do |h, k|
        h[k] = [] of Array(String)
      end
    end

    def call
      feeds.each do |feed|
        feed.read.reduce(@results) do |results, row|
          results[feed.name] << row if @filters.all? { |filter| filter.match?(row) }
          results
        end
      end
    end

    private def feeds
      Dir["#{@feeds_path}/*"].map { |src| Feed.new(src) }
    end
  end
end
