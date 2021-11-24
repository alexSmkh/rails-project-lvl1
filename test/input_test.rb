# frozen_string_literal: true

require 'test_helper'

class InputTest < Minitest::Test
  def test_input_without_value
    expected_input = '<input name="name" type="text">'

    assert_equal expected_input, Input.new({ name: 'name' }).render
  end

  def test_input_with_value
    expected_input = '<input name="name" type="text" value="value">'
    input = Input.new({ name: 'name', value: 'value' }).render

    assert_equal expected_input, input
  end

  def test_input_with_different_types
    expected_number_input = '<input name="number-input" type="number">'
    expected_tel_input = '<input name="tel-input" type="tel">'
    expected_default_input = '<input name="default-input" type="text">'

    number_input = Input.new({ name: 'number-input', type: 'number' }).render
    tel_input = Input.new({ name: 'tel-input', type: 'tel' }).render
    default_text_input = Input.new({ name: 'default-input' }).render

    assert_equal expected_number_input, number_input
    assert_equal expected_tel_input, tel_input
    assert_equal expected_default_input, default_text_input
  end
end
