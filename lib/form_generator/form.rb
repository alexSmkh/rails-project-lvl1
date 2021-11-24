# frozen_string_literal: true

require_relative 'label'
require_relative 'input'
require_relative 'textarea'

class Form
  def initialize(field_schema, action_url = '#')
    @field_schema = field_schema
    @elements = []
    @action = action_url
  end

  def input(name_attr, options = {})
    attr_value = @field_schema.public_send(name_attr)
    @elements << Label.new({ for: name_attr })
    @elements << if options[:as] == 'text'
                   inner_text = attr_value.nil? ? '' : attr_value
                   textarea_attrs = { name: name_attr, inner_text: inner_text }
                   Textarea.new(textarea_attrs)
                 else
                   input_attrs = { name: name_attr, value: attr_value, type: options[:type] }
                   Input.new(input_attrs)
                 end
  end

  def submit(value = 'save')
    submit_attrs = { name: 'commit', type: 'submit', value: value.capitalize }
    @elements << Input.new(submit_attrs)
  end

  def render
    rendered_elements = @elements.map(&:render).join
    %(<form action="#{@action}" method="post">#{rendered_elements}</form>)
  end
end
