# encoding: utf-8
require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::NavigationHelpers do
  include BootstrapSpecHelper
  include Twitter::Bootstrap::Markup::Rails::Helpers::NavigationHelpers
  include BootstrapNavigationMacros

  describe "#bootstrap_navigation" do
    before do
      @output_buffer = ''
    end

    it "should create a basic navigation list of type tabs" do
      build_bootstrap_navigation do |nav|
        nav.link_to "Nav1", "/link1", :active_nav => true
        nav.link_to "Nav2", "/link2"
      end

      expect(output_buffer).to have_tag('ul.nav.nav-tabs') do |ul|
        with_tag('li[@class="active"] a[@href="/link1"]')
        with_tag('li a[@href="/link1"]')
      end
    end

    it "should create a basic navigation list of type tabs with a custom, user specified, ID" do
      build_bootstrap_navigation(:custom_classes => "testing") do |nav|
        nav.link_to "Nav1", "/link1", :active_nav => true
        nav.link_to "Nav2", "/link2"
      end

      expect(output_buffer).to have_tag('ul.nav.nav-tabs.testing') do |ul|
        with_tag('li[@class="active"] a[@href="/link1"]')
        with_tag('li a[@href="/link1"]')
      end
    end

    it "should create a basic navigation list of type pills" do
      build_bootstrap_navigation(:type => "pills") do |nav|
        nav.link_to "Nav1", "/link1"
        nav.link_to "Nav2", "/link2", :active_nav => true
      end

      expect(output_buffer).to have_tag('ul.nav.nav-pills') do |ul|
        with_tag('li a[@href="/link1"]')
        with_tag('li[class="active"] a[@href="/link2"]')
      end
    end

    it "should create a vertical navigation list of type tabs when called with a list of links" do
      build_bootstrap_navigation(:type => "tabs", :stacked => true) do |nav|
        nav.link_to "Nav1", "/link1", :active_nav => true
        nav.link_to "Nav2", "/link2"
      end

      expect(output_buffer).to have_tag('ul.nav.nav-tabs.nav-stacked') do |ul|
        with_tag('li[@class="active"] a[@href="/link1"]')
        with_tag('li a[@href="/link1"]')
      end
    end

    it "should create a vertical navigation list of type pills when called with a list of links" do
      build_bootstrap_navigation(:type => "pills", :stacked => true) do |nav|
        nav.link_to "Nav1", "/link1"
        nav.link_to "Nav2", "/link2", :active_nav => true
      end

      expect(output_buffer).to have_tag('ul.nav.nav-pills.nav-stacked') do |ul|
        with_tag('li a[@href="/link1"]')
        with_tag('li[@class="active"] a[@href="/link2"]')
      end
    end
  end
end
