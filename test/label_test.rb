# frozen_string_literal: true

require 'test_helper'

class LabelTest < Minitest::Test
  def test_label
    expected_label = '<label for="name">Name</label>'
    label = Label.new({ for: 'name' }).render

    assert_equal expected_label, label
  end
end
