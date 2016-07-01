require "option_parser"
require "./jda/*"

module JDA
  class Main
    def initialize
      @filters = [] of Filters::Base
      @src = "./"
    end

    def call
      setup
      return if @filters.empty?
      Scanner.new(filters: @filters, path: @src).call(STDOUT)
    end

    private def setup
      OptionParser.parse! do |parser|
        parser.banner = "Usage: ./jda -s ./samples -x -k 804511615,806732962 -t 25008,25005"
        parser.on("-s SRC", "--src=SRC", "Specify feeds path (default to CWD)") { |src| @src = src }
        parser.on("-x", "--markdown", "Filter by markdown price") { @filters << Filters::Sale.new }
        parser.on("-k SKUS", "--skus=SKUS", "Filter by specified SKUs") { |skus| @filters << Filters::Sku.new(skus.split(",").map(&.strip)) }
        parser.on("-t STORES", "--stores=STORES", "Filter by specified store codes") { |stores| @filters << Filters::Store.new(stores.split(",").map(&.strip)) }
        parser.on("-h", "--help", "Show this help") { puts parser }
      end
    end
  end
end

JDA::Main.new.call
