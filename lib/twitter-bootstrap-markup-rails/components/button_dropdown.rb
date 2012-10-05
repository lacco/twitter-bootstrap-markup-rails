module Twitter::Bootstrap::Markup::Rails::Components
  class ButtonDropdown < Base
    attr_reader :collection

    def initialize(elements, options = {})
      super
      @elements = elements
    end

    def to_s
      output_buffer << content_tag(:div, options[:html_options]) do
        html=''
        html << build_dropdown

        html << content_tag(:ul, options[:menu_html_options]) do
          menu = ''
          @elements.each do |e|
            menu << content_tag(:li, e.to_s)
          end
          menu.html_safe
        end

        html.html_safe
      end
      super
    end

    private
    def default_options
      option({
        :html_options => option({:class => option("btn-group")}),
        :split => false,
        :button_options => {},
        :menu_html_options => option({:class => option("dropdown-menu")})
      })
    end

    def build_dropdown
      html = ''

      if @elements.size > 0
        dropdown = @elements.shift.component
        dropdown.options.merge!(options[:button_options])
        dropdown.options.merge!(:dropdown => !options[:split])

        html << dropdown.to_s

        if options[:split]
          caret = Button.new({:dropdown => true}.merge(options[:button_options]))
          html << caret.to_s
        end
      end

      html
    end
  end
end

