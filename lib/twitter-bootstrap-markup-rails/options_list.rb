module Twitter::Bootstrap::Markup::Rails
  class OptionsList < String
    def initialize(string_or_array)
      super
      @data = Set.new
      merge!(string_or_array)
    end

    def merge!(other_list)
      return self if other_list.blank?

      other_list = other_list.split(" ") if other_list.kind_of?(String)

      other_list.each do |element|
        if element[0] == "-"
          @data.delete(element[1..-1])
        else
          @data.add(element)
        end
      end

      replace(@data.to_a.join(" "))

      self
    end
  end
end