require "csv"

module JDA
  module Filters
    abstract struct Base
      def initialize(@values : Array(String), @index : Int8)
      end

      def matches?(row : Array(String))
        row[@index].try do |value|
          @values.includes?(value.strip)
        end
      end
    end

    struct Sku < Base
      def initialize(@values : Array(String))
        super(values: @values, index: 0_i8)
      end
    end

    struct Sale < Base
      def initialize
        super(values: %w(Y), index: 14_i8)
      end
    end

    struct Store < Base
      def initialize(@values : Array(String))
        super(values: @values, index: 1_i8)
      end
    end
  end
end
