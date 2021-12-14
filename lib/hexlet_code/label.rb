# frozen_string_literal: true

class Label
  autoload(:TagBuilder, 'hexlet_code/tag_builder')

  def initialize(attrs)
    @attrs = attrs
    @inner_text = attrs[:for]
  end

  def render
    TagBuilder.build('label', @attrs) { @inner_text }
  end
end
