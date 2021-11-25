# frozen_string_literal: true

require 'bundler'

Bundler.require :default, :test

RSpec.configure do |config|
  config.include RSpecHtmlMatchers
end
