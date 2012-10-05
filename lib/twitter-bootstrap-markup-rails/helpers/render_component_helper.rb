module Twitter::Bootstrap::Markup::Rails::Helpers
  module RenderComponentHelper
    def bootstrap_render_component(options)
      component = yield
      if options.delete(:html) != false
        component.to_s
      else
        component
      end
    end
  end
end
