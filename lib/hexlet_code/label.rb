# frozen_string_literal: true

require_relative 'tag'

class Label
  def initialize(attrs, inner_text)
    @attrs = attrs
    @inner_text = inner_text
  end

  def render
    Tag.build('label', @attrs) { @inner_text }
  end
end
