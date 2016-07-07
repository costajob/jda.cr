require "./filters.cr"
require "./feed.cr"
require "./report.cr"

module JDA
  class Scanner
    DEFAULT_PATH = File.expand_path("../../../samples", __FILE__)

    getter :results

    def initialize(@filters : Array(Filters::Base), @path = DEFAULT_PATH)
      @results = Hash(String, Array(Array(String))).new do |h, k|
        h[k] = [] of Array(String)
      end
    end

    def call(output = MemoryIO.new)
      feeds.each do |feed|
        feed.each_row do |row|
          @results[feed.name] << row if @filters.all? { |filter| filter.matches?(row) }
        end
        Report.new(feed.name, @results[feed.name]).render(output)
      end
    end

    private def feeds
      Dir["#{@path}/#{Feed.ext_pattern}"].map { |src| Feed.new(src) }
    end
  end
end
