# frozen_string_literal: true

require_relative 'tag'

class Label
  def initialize(attrs)
    @label_attrs = {}
    @label_attrs[:for] = attrs[:for]
    @label_inner_text = attrs[:for].capitalize
  end

  def render
    Tag.build('label', @label_attrs) { @label_inner_text }
  end
end
