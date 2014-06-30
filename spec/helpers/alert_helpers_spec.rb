# encoding: utf-8
require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::AlertHelpers do
  include BootstrapSpecHelper
  include Twitter::Bootstrap::Markup::Rails::Helpers::AlertHelpers

  describe "#bootstrap_alert_tag" do
    before do
      @output_buffer = ''
    end

    it "has no heading by default" do
      concat bootstrap_alert_tag("Message", :heading => nil)
      expect(output_buffer).to_not have_tag('div strong')
      expect(output_buffer).to_not have_tag('div h4.alert-heading')
    end

    it "has alert class" do
      concat bootstrap_alert_tag("Message")
      expect(output_buffer).to have_tag("div.alert")
    end

    it "has a message" do
      concat bootstrap_alert_tag("Message")
      expect(output_buffer).to have_tag('div', /Message/)
    end

    it "has a close button when :close is true" do
      concat bootstrap_alert_tag("Message", :close => true)
      expect(output_buffer).to have_tag('div a.close', /×/)
    end

    it "has no close button when :close is false" do
      concat bootstrap_alert_tag("Message", :close => false)
      expect(output_buffer).to_not have_tag('div a.close')
    end

    it "has a dismiss tag" do
      concat bootstrap_alert_tag("Message")
      expect(output_buffer).to have_tag('div a[data-dismiss="alert"]')
    end

    it "has a h4 heading when :block is true" do
      concat bootstrap_alert_tag("message", :heading => "heading1", :block => true)
      expect(output_buffer).to have_tag('div h4.alert-heading', /heading1/)
    end

    it "has a strong heading when :block is false" do
      concat bootstrap_alert_tag("Message", :heading => "Heading1", :block => false)
      expect(output_buffer).to have_tag('div strong', /Heading1/)
    end

    it "should add html_options to the resulting DIV tag when specified" do
      concat bootstrap_alert_tag("Message", :html_options => {:"data-test" => "42"})
      expect(output_buffer).to have_tag("div[data-test='42']")
    end
  end

  %w(error success info).each do |type|
    describe "#bootstrap_alert_#{type}_block_tag" do
      before do
        @output_buffer = ''
      end

      it "has alert class" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        expect(output_buffer).to have_tag("div.alert")
      end

      it "has alert-block class" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        expect(output_buffer).to have_tag("div.alert-block")
      end

      it "has alert-#{type} class" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        expect(output_buffer).to have_tag("div.alert-#{type}")
      end

      it "has a message" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        expect(output_buffer).to have_tag('div', /Message/)
      end

      it "has close button" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        expect(output_buffer).to have_tag('div a.close', /×/)
      end

      it "has dismiss tag" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        expect(output_buffer).to have_tag('div a[data-dismiss="alert"]')
      end

      it "has a heading" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message", :heading => "Heading1")
        expect(output_buffer).to have_tag('div h4.alert-heading', /Heading1/)
      end
    end

    describe "#bootstrap_alert_#{type}_tag" do
      before do
        @output_buffer = ''
      end

      it "has alert class" do
        concat send("bootstrap_alert_#{type}_tag", "Message")
        expect(output_buffer).to have_tag("div.alert")
      end

      it "has alert-#{type} class" do
        concat send("bootstrap_alert_#{type}_tag", "Message")
        expect(output_buffer).to have_tag("div.alert-#{type}")
      end

      it "has a message" do
        concat send("bootstrap_alert_#{type}_tag", "Message")
        expect(output_buffer).to have_tag('div', /Message/)
      end

      it "has close button" do
        concat send("bootstrap_alert_#{type}_tag", "Message")
        expect(output_buffer).to have_tag('div a.close', /×/)
      end

      it "has dismiss tag" do
        concat send("bootstrap_alert_#{type}_tag", "Message")
        expect(output_buffer).to have_tag('div a[data-dismiss="alert"]')
      end

      it "has a heading" do
        concat send("bootstrap_alert_#{type}_tag", "Message", :heading => "Heading1")
        expect(output_buffer).to have_tag('div strong', /Heading1/)
      end
    end
  end
end

