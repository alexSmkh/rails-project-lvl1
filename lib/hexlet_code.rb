# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form'

module HexletCode
  class Error < StandardError; end

  def self.form_for(fields_scheme, attrs = {})
    form = Form.new(fields_scheme, attrs)
    yield(form) if block_given?
    form.render
  end
end
