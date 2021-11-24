# frozen_string_literal: true

require_relative 'tag'

class Textarea
  def initialize(attrs)
    @textarea_attrs = {}
    @textarea_attrs[:cols] = attrs[:cols] || '20'
    @textarea_attrs[:rows] = attrs[:rows] || '40'
    @textarea_attrs[:name] = attrs[:name]
    @textarea_inner_text = attrs[:inner_text] || ''
  end

  def render
    Tag.build('textarea', @textarea_attrs) { @textarea_inner_text }
  end
end
