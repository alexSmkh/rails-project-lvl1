# frozen_string_literal: true

require_relative 'tag'

class Input
  def initialize(attrs)
    default_attrs = { type: 'text' }
    @attrs = default_attrs.merge(attrs)
    @label = Label.new({ for: attrs[:name] })
  end

  def render
    [@label.render, Tag.build('input', @attrs)].join
  end
end
