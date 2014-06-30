# encoding: utf-8
require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::FormHelpers do
  include BootstrapSpecHelper
  include Twitter::Bootstrap::Markup::Rails::Helpers::FormHelpers
  include BootstrapFormMacros

  before do
    @output_buffer = ''
  end

  describe "#bootstrap_form_for" do
    it "should create a form tag" do
      block = Proc.new {}
      concat bootstrap_form_for 'an_object', :url => 'a_url', &block
      expect(output_buffer).to have_tag('form')
    end

    context "text_field" do
      it "should wrap a text input within the magical div tags" do
        build_bootstrap_form do |f|
          f.text_field 'method'
        end

        expect(output_buffer).to have_tag('div.control-group div.controls input[type=text]')
      end

      it "should add a label tag if :label is true" do
        build_bootstrap_form do |f|
          f.text_field 'method', :label => true
        end

        expect(output_buffer).to have_tag('div.control-group') do
          with_tag('label.control-label')
          with_tag('div.controls') do
            with_tag('input')
          end
        end
      end

      it "should add a label tag with custom text if :label_text is specified" do
        build_bootstrap_form do |f|
          f.text_field 'method', :label_text => 'a custom label'
        end

        expect(output_buffer).to have_tag('div.control-group') do
          with_tag('label.control-label', :text => 'a custom label')
          with_tag('div.controls') do
            with_tag('input')
          end
        end
      end

      context "add_on" do
        it "should wrap the input in div.input-prepend if :add_on hash is specified" do
          build_bootstrap_form do |f|
            f.text_field 'method', :add_on => {}
          end

          expect(output_buffer).to have_tag('div.control-group') do
            with_tag('div.controls') do
              with_tag('div.input-prepend') do
                with_tag('input')
              end
            end
          end
        end

        it "should wrap the input in div.input-append if :position is :append" do
          build_bootstrap_form do |f|
            f.text_field 'method', :add_on => {:position => :append}
          end

          expect(output_buffer).to have_tag('div.control-group') do
            with_tag('div.controls') do
              with_tag('div.input-append') do
                with_tag('input')
              end
            end
          end
        end

        it "should add a span with text if :text is specified" do
          build_bootstrap_form do |f|
            f.text_field 'method', :add_on => {:text => 'a text'}
          end

          expect(output_buffer).to have_tag('div.control-group') do
            with_tag('div.controls') do
              with_tag('div.input-prepend') do
                with_tag('input')
                with_tag('span', :class => 'add-on', :text => 'a text')
              end
            end
          end
        end

        it "should add a span with icon if :icon is specified" do
          build_bootstrap_form do |f|
            f.text_field 'method', :add_on => {:icon => 'icon-envelope'}
          end

          expect(output_buffer).to have_tag('div.control-group') do
            with_tag('div.controls') do
              with_tag('div.input-prepend') do
                with_tag('input')
                with_tag('span', :class => 'add-on') do
                  with_tag('i', :class => 'icon-envelope')
                end
              end
            end
          end
        end

        it "should add a help-block with custom text if :html_text is specified" do
          build_bootstrap_form do |f|
            f.text_field 'method', :help_text => 'You need help!'
          end

          expect(output_buffer).to have_tag('div.control-group') do
            with_tag('div.controls') do
              with_tag('p', :class => 'help-block', :text => 'You need help!')
            end
          end
        end

      end
    end

    context "password_field" do
      it "should wrap a text input within the magical div tags" do
        build_bootstrap_form do |f|
          f.password_field 'method'
        end

        expect(output_buffer).to have_tag('div.control-group div.controls input[type=password]')
      end
    end
  end
end
