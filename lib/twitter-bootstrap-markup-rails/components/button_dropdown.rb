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

        if build_dropdown_menu?
          html << content_tag(:ul, options[:menu_html_options].merge(role: "menu")) do
            menu = ''
            @elements.each do |e|
              menu << content_tag(:li, e.to_s)
            end
            menu.html_safe
          end
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
        :split_button_options => nil, # defaults to button_options
        :menu_html_options => option({:class => option("dropdown-menu")})
      })
    end

    def build_dropdown
      html = ''

      if @elements.size > 0
        caret_btn = "".html_safe

        dropdown = @elements.shift.component
        dropdown.options.merge!(options[:button_options])

        if build_dropdown_menu?
          if build_split?
            caret_btn = Button.new({:dropdown => true}.merge(options[:split_button_options].presence || options[:button_options]))
          else
            dropdown.options.merge!(:dropdown => true)
          end
        end

        html << dropdown.to_s << caret_btn.to_s
      end

      html
    end

    def build_dropdown_menu?
      @elements.size > 0
    end

    def build_split?
      options[:split]
    end
  end
end

