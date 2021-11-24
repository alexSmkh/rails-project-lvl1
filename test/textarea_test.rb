# frozen_string_literal: true

require 'test_helper'

class TextareaTest < Minitest::Test
  def test_default_textarea
    expected_textarea = '<textarea cols="20" rows="40" name="about"></textarea>'
    textarea = Textarea.new({ name: 'about' })

    assert_equal expected_textarea, textarea.render
  end

  def test_textarea_with_inner_text
    expected_textarea = '<textarea cols="20" rows="40" name="about">text</textarea>'
    textarea = Textarea.new({ name: 'about', inner_text: 'text' })

    assert_equal expected_textarea, textarea.render
  end
end
