require 'spec_helper'
require 'simple_navigation'
require "twitter-bootstrap-markup-rails/plugins/simple_navigation/renderer/bootstrap_topbar_list"

describe SimpleNavigation::Renderer::BootstrapTopbarList do
  it "registers the renderer" do
    expect(SimpleNavigation.registered_renderers).to include({
      :bootstrap_topbar_list => SimpleNavigation::Renderer::BootstrapTopbarList
    })
  end
end
