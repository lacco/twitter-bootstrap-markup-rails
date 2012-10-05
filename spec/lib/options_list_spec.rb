# encoding: utf-8
require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::OptionsList do
  describe "#merge!" do
    it "should merge elements correctly" do
      Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo").merge!("bar").should == "foo bar"
    end

    it "should handle duplicated elements" do
      Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo").merge!("foo bar").should == "foo bar"
    end

    it "should be able to merge arrays" do
      Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo").merge!(["bar"]).should == "foo bar"
    end

    it "should handle nil" do
      Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo").merge!(nil).should == "foo"
    end

    it "should delete elements that are prefixed with -" do
      Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo bar").merge!("-foo").should == "bar"
      Twitter::Bootstrap::Markup::Rails::OptionsList.new("foo bar").merge!(["-bar", "-foo", "blub"]).should == "blub"
    end
  end
end
