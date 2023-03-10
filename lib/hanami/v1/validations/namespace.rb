# frozen_string_literal: true

require "hanami/utils/string"

module Hanami
  module V1
    module Validations
      # Validations message namespace.
      #
      # For a given `FooValidator` class, it will look for I18n messages within
      # the `foo` group.
      #
      # @since 0.6.0
      # @api private
      class Namespace
        # @since 0.6.0
        # @api private
        SUFFIX = "Validator"

        # @since 0.6.0
        # @api private
        SUFFIX_REPLACEMENT = ""

        # @since 0.6.0
        # @api private
        RUBY_NAMESPACE_SEPARATOR = "/"

        # @since 0.6.0
        # @api private
        RUBY_NAMESPACE_REPLACEMENT = "."

        # @since 0.6.0
        # @api private
        def self.new(name, klass)
          result = name || klass.name
          return nil if result.nil?

          super(result)
        end

        # @since 0.6.0
        # @api private
        def initialize(name)
          @name = name
        end

        # @since 0.6.0
        # @api private
        def to_s
          underscored_name.gsub(RUBY_NAMESPACE_SEPARATOR, RUBY_NAMESPACE_REPLACEMENT)
        end

        private

        # @since 0.6.0
        # @api private
        def underscored_name
          Hanami::Utils::String.underscore(name_without_suffix)
        end

        # @since 0.6.0
        # @api private
        def name_without_suffix
          @name.sub(SUFFIX, SUFFIX_REPLACEMENT)
        end
      end
    end
  end
end
