# encoding: utf-8

require 'rspec-rails'
require 'rspec-html-matchers'

RSpec.configure do |config|
  config.include RSpec::HtmlMatchers
  config.mock_with :rspec
end

require "action_controller/railtie"

# Create a simple rails application for use in testing the viewhelper
module BootstrapTest
  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"
    config.active_support.deprecation = :stderr
    config.eager_load = true
  end
end
BootstrapTest::Application.initialize!

require 'rspec/rails'
