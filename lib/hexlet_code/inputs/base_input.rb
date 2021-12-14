# frozen_string_literal: true

class BaseInput
  autoload(:Label, 'hexlet_code/label')
  autoload(:TagBuilder, 'hexlet_code/tag_builder')

  def initialize(attrs)
    @label = Label.new({ for: attrs[:name] })
  end
end
