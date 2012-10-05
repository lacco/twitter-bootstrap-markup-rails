module Twitter::Bootstrap::Markup::Rails::Components
  class Button < Base
    include ActionView::Helpers::UrlHelper

    def to_s
      html_text = ""
      html_text << build_icon.html_safe << ' ' if options[:icon]
      html_text << (options[:text].respond_to?(:call) ? options[:text].call : options[:text]).to_s
      html_text << ' ' << build_caret.html_safe if options[:dropdown]

      output_buffer << content_tag(:a, html_text.html_safe, build_tag_options).html_safe
      super
    end

    private
    def default_options
      option({
        :text         => nil,
        :link         => "#",
        :class        => option("btn"),
        :type         => option(""),
        :disabled     => false,
        :icon_white   => false,
        :dropdown     => false,
        :id           => nil,
        :html_options => {}
      })
    end

    def build_class
      options[:class].merge!(options[:type])
      options[:class].merge!("dropdown-toggle") if options[:dropdown]
      options[:class].merge!("disabled") if options[:disabled]
    end

    def build_icon
      klass = options[:icon]
      klass << ' icon-white' if options[:icon_white]
      content_tag(:i, nil, :class => klass)
    end

    def build_caret
      content_tag(:span, nil, :class => 'caret')
    end

    def build_tag_options
      build_class

      ops = { :href => build_link, :class => options[:class] }
      ops[:"data-toggle"] = 'dropdown' if options[:dropdown]
      ops[:id] = options[:id] if options[:id]
      ops.reverse_merge(options[:html_options])
    end

    def build_link
      url_for(options[:link]) if options[:link].present?
    end
  end
end
