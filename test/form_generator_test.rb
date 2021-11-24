# frozen_string_literal: true

require 'test_helper'

class FormGeneratorTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FormGenerator::VERSION
  end

  def setup
    @user_struct = Struct.new(:name, :job, :about, keyword_init: true)
  end

  def test_form_for_function
    expected_form = File.read('test/fixtures/form/form_with_elements.html')
    user = @user_struct.new(name: 'Frank', job: 'programmer')
    form = FormGenerator.form_for user, url: '/user' do |f|
      f.input :name
      f.input :job
      f.input :about, as: 'text'
      f.submit
    end

    assert_equal expected_form, form
  end
end
