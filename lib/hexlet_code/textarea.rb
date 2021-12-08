# frozen_string_literal: true

class Textarea
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:Label, 'hexlet_code/label')

  def initialize(params)
    default_attrs = { cols: '20', rows: '40' }
    @attrs = default_attrs.merge(params.except(:value))
    @inner_text = params[:value] || ''
    @label = Label.new({ for: params[:name] })
  end

  def render
    [@label.render, Tag.build('textarea', @attrs) { @inner_text }].join
  end
end
