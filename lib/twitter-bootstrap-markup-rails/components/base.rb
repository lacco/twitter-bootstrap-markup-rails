# -*- encoding: utf-8 -*-
module Twitter::Bootstrap::Markup::Rails::Components
  class Base
    include ActionView::Helpers::TagHelper

    attr_accessor :output_buffer, :options, :default_options

    def initialize(*args)
      @output_buffer = ""
      @options = default_options.merge!(args.extract_options!)
    end

    def to_s
      @output_buffer.to_s.html_safe
    end

    def option(object)
      case object
        when String, Array then Twitter::Bootstrap::Markup::Rails::OptionsList.new(object)
        when Hash then Twitter::Bootstrap::Markup::Rails::OptionsHash.new(object)
        else raise "Unknown option class for #{object.inspect}"
      end
    end
  end
end

