# frozen_string_literal: true

class Label
  autoload(:Tag, 'hexlet_code/tag')

  def initialize(attrs)
    @attrs = attrs
    @inner_text = attrs[:for]
  end

  def render
    Tag.build('label', @attrs) { @inner_text }
  end
end
