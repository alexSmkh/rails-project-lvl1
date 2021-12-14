# frozen_string_literal: true

class Submit
  autoload(:Tag, 'hexlet_code/tag')

  def initialize(attrs)
    default_attrs = { type: 'submit' }
    @attrs = default_attrs.merge(attrs)
  end

  def render
    Tag.build('input', @attrs)
  end
end
