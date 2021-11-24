# frozen_string_literal: true

require_relative 'form_generator/version'
require_relative 'form_generator/form'

module FormGenerator
  class Error < StandardError; end

  def self.form_for(fields_scheme, params = {})
    form = Form.new(fields_scheme, params[:url])
    yield(form) if block_given?
    form.render
  end
end
