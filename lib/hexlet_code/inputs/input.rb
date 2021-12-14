# frozen_string_literal: true

require_relative 'base_input'

class Input < BaseInput
  def initialize(attrs)
    super(attrs)
    default_attrs = { type: 'text' }
    @attrs = default_attrs.merge(attrs)
  end

  def render
    [@label.render, TagBuilder.build('input', @attrs)].join
  end
end
