# frozen_string_literal: true

require_relative 'tag'

class Input
  def initialize(attrs)
    default_attrs = { type: 'text' }
    @attrs = default_attrs.merge(attrs)
  end

  def render
    Tag.build('input', @attrs)
  end
end
