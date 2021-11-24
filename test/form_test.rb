# frozen_string_literal: true

require 'test_helper'

class FormTest < Minitest::Test
  def setup
    @scheme_struct = Struct.new(:name, :age, :about, keyword_init: true)
  end

  def test_init_form_with_action
    form = Form.new(@scheme_struct.new, '/user')
    expected_form = '<form action="/user" method="post"></form>'

    assert_equal expected_form, form.render
  end

  def test_init_form_without_action
    form = Form.new(@scheme_struct.new)
    expected_form = '<form action="#" method="post"></form>'

    assert_equal expected_form, form.render
  end

  def test_submit_method_without_args
    expected_form = File.read('test/fixtures/form/submit_without_args.html')
    form = Form.new(@scheme_struct.new)
    form.submit

    assert_equal expected_form, form.render
  end

  def test_submit_method_with_args
    expected_form = File.read('test/fixtures/form/submit_with_args.html')
    form = Form.new(@scheme_struct.new)
    form.submit 'send'

    assert_equal expected_form, form.render
  end

  def test_input_method_without_options
    user = @scheme_struct.new name: 'Nick'
    form = Form.new(user)
    form.input :name
    expected_form = File.read('test/fixtures/form/input_without_options.html')

    assert_equal expected_form, form.render
  end

  def test_input_method_with_options
    user = @scheme_struct.new age: '1', about: 'about'
    form = Form.new(user)
    form.input :age, type: 'number'
    form.input :about, as: 'text'
    expected_form = File.read('test/fixtures/form/input_with_options.html')

    assert_equal expected_form, form.render
  end

  def test_raise_error_on_noneexistent_field
    scheme = @scheme_struct.new
    form = Form.new(scheme)
    assert_raises(NoMethodError) { form.input :jjjjj }
  end
end
