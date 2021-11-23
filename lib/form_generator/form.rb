# frozen_string_literal: true

class Form
  def initialize(field_schema, url)
    @field_schema = field_schema
    @elements = []
    @action = url
  end

  def input(name_attr, as_option = {})
    tag_value = @field_schema.public_send(name_attr)
    @elements << Tag.build('label', { for: name_attr }) { name_attr.capitalize }
    @elements << if as_option.key(:as) == 'text'
                   textarea_attrs = { name: name_attr, cols: '20', rows: '40' }
                   Tag.build('textarea', textarea_attrs) { value.nil? ? '' : value }
                 else
                   input_attrs = { name: name_attr, type: 'text' }
                   input_attrs.merge(value: tag_value) unless tag_value.nil?
                   Tag.build('input', input_attrs)
                 end
  end

  def submit(value = 'save')
    submit_attrs = { name: 'commit', type: 'submit', value: value.capitalize }
    @elements << Tag.build('input', submit_attrs)
  end

  def render
    %(<form action="#{@action}" method="post">#{@elements.join}</form>)
  end
end
