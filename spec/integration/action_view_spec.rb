require 'spec_helper'

describe ActionView::Base do
  before do
    @view = ActionView::Base
  end

  it "includes alert helpers" do
    expect(@view.ancestors).to include(Twitter::Bootstrap::Markup::Rails::Helpers::AlertHelpers)
  end

  it "includes inline label helpers" do
    expect(@view.ancestors).to include(Twitter::Bootstrap::Markup::Rails::Helpers::InlineLabelHelpers)
  end

  it "includes inline form helpers" do
    expect(@view.ancestors).to include(Twitter::Bootstrap::Markup::Rails::Helpers::FormHelpers)
  end

  it "includes inline navigation helpers" do
    expect(@view.ancestors).to include(Twitter::Bootstrap::Markup::Rails::Helpers::NavigationHelpers)
  end
end
