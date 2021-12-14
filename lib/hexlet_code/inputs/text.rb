# frozen_string_literal: true

require_relative 'base_input'

class Text < BaseInput
  def initialize(params)
    super(params)
    default_attrs = { cols: '20', rows: '40' }
    @attrs = default_attrs.merge(params.except(:value))
    @inner_text = params[:value] || ''
  end

  def render
    [@label.render, Tag.build('textarea', @attrs) { @inner_text }].join
  end
end
