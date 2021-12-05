# frozen_string_literal: true

require_relative 'tag'

class Label
  def initialize(attrs)
    @attrs = attrs
    @inner_text = attrs[:for]
  end

  def render
    Tag.build('label', @attrs) { @inner_text }
  end
end
