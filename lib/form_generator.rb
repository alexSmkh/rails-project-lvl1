# frozen_string_literal: true

require_relative 'form_generator/version'
require_relative 'form_generator/form'
require_relative 'form_generator/tag'

module FormGenerator
  class Error < StandardError; end

  def self.form_for(field_schema, params = {})
    action = params.key?(:url) ? params[:url] : '#'
    form = Form.new(field_schema, action)
    yield(form)
    form.render
  end
end
