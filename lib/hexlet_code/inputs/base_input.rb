# frozen_string_literal: true

class BaseInput
  autoload(:Label, 'hexlet_code/label')
  autoload(:Tag, 'hexlet_code/tag')

  def initialize(attrs)
    @label = Label.new({ for: attrs[:name] })
  end
end
