# frozen_string_literal: true

require_relative 'label'
require_relative 'input'
require_relative 'textarea'
require_relative 'tag'

class Form
  def initialize(field_schema, attrs = { url: '#', method: 'post' })
    @field_schema = field_schema
    @elements = []
    @attrs = attrs
  end

  def input(name_attr, options = {})
    attr_value = @field_schema.public_send(name_attr)
    element_attrs = options.except(:as)
    @elements << Label.new({ for: name_attr }, name_attr)
    @elements << if options[:as] == :text
                   inner_text = attr_value.nil? ? '' : attr_value
                   textarea_attrs = { name: name_attr }.merge(element_attrs)
                   Textarea.new(textarea_attrs, inner_text)
                 else
                   input_attrs = { name: name_attr, value: attr_value }.merge(element_attrs)
                   Input.new(input_attrs)
                 end
  end

  def submit(value = 'save')
    submit_attrs = { name: 'commit', type: 'submit', value: value.capitalize }
    @elements << Input.new(submit_attrs)
  end

  def render
    rendered_elements = @elements.map(&:render).join
    Tag.build('form', @attrs) { rendered_elements }
  end
end
