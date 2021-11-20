# frozen_string_literal: true

require_relative 'form_generator/version'

module FormGenerator
  class Error < StandardError
  end

  # This class responsible for creating an html tag
  class Tag
    class << self
      def build(tag, attrs = {})
        tag_attrs = build_attrs(attrs)

        return "<#{tag}#{tag_attrs}>#{yield}</#{tag}>" if block_given?

        "<#{tag}#{tag_attrs}>"
      end

      private

      def build_attrs(attrs)
        attrs.map { |key, value| " #{key}=\"#{value}\"" }.join
      end
    end
  end
end
