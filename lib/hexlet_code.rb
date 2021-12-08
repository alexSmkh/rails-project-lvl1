# frozen_string_literal: true

module HexletCode
  autoload(:Form, 'hexlet_code/form.rb')
  autoload(:VERSION, 'hexlet_code/version')

  class Error < StandardError; end

  def self.form_for(fields_scheme, attrs = {})
    form = Form.new(fields_scheme, attrs)
    yield(form)
    form.render
  end
end
