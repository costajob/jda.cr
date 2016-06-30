module JDA
  struct Filter
    def initialize(@values : Array(String), @index : Int8)
    end

    def match?(row : Array(String))
      row[@index].try do |value|
        @values.includes?(value.strip)
      end
    end
  end
end
