# encoding: utf-8
require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::OptionsList do
  describe "#merge!" do
    it "should merge elements correctly" do
      expect(Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo").merge!("bar")).to eq("foo bar")
    end

    it "should handle duplicated elements" do
      expect(Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo").merge!("foo bar")).to eq("foo bar")
    end

    it "should be able to merge arrays" do
      expect(Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo").merge!(["bar"])).to eq("foo bar")
    end

    it "should handle nil" do
      expect(Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo").merge!(nil)).to eq("foo")
    end

    it "should delete elements that are prefixed with -" do
      expect(Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo bar").merge!("-foo")).to eq("bar")
      expect(Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo bar").merge!(["-bar", "-foo", "blub"])).to eq("blub")
    end
  end
end
