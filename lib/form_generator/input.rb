# frozen_string_literal: true

class Input
  def initialize(attrs)
    @input_attrs = {}
    @input_attrs[:name] = attrs[:name]
    @input_attrs[:type] = attrs[:type] || 'text'
    @input_attrs[:value] = attrs[:value]
  end

  def render
    Tag.build('input', @input_attrs.compact)
  end
end
