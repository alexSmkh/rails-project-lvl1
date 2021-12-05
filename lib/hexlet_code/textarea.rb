# frozen_string_literal: true

require_relative 'tag'

class Textarea
  def initialize(attrs, inner_text)
    default_attrs = { cols: '20', rows: '40' }
    @attrs = default_attrs.merge(attrs)
    @inner_text = inner_text
    @label = Label.new({ for: attrs[:name] }, attrs[:name])
  end

  def render
    [@label.render, Tag.build('textarea', @attrs) { @inner_text }]
  end
end
