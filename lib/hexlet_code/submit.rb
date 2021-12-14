# frozen_string_literal: true

class Submit
  autoload(:TagBuilder, 'hexlet_code/tag_builder')

  def initialize(attrs)
    default_attrs = { type: 'submit' }
    @attrs = default_attrs.merge(attrs)
  end

  def render
    TagBuilder.build('input', @attrs)
  end
end
