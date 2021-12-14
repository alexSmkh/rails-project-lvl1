# frozen_string_literal: true

class Form
  autoload(:Inputs, 'hexlet_code/inputs')
  autoload(:Submit, 'hexlet_code/submit')
  autoload(:Tag, 'hexlet_code/tag')

  def initialize(field_schema, attrs = { url: '#', method: 'post' })
    @field_schema = field_schema
    @elements = []
    @attrs = attrs
  end

  def input(name_attr, options = {})
    attr_value = @field_schema.public_send(name_attr)
    element_attrs = options.except(:as).merge({ name: name_attr })
    params = attr_value.nil? ? element_attrs : element_attrs.merge({ value: attr_value })

    default_input_type = 'input'
    input_type = (options[:as] || default_input_type).capitalize.to_s
    @elements << Inputs.const_get(input_type).new(params)
  end

  def submit(value = 'save', options = {})
    submit_attrs = { name: 'commit', value: value.capitalize }.merge(options)
    @elements << Submit.new(submit_attrs)
  end

  def render
    rendered_elements = @elements.map(&:render).join
    Tag.build('form', @attrs) { rendered_elements }
  end
end
