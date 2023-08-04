require_relative './base_params'
require_relative '../validations/form'

module Hanami
  module V1
    module Action
      # A set of params requested by the client
      #
      # It's able to extract the relevant params from a Rack env of from an Hash.
      #
      # There are three scenarios:
      #   * When used with Hanami::Router: it contains only the params from the request
      #   * When used standalone: it contains all the Rack env
      #   * Default: it returns the given hash as it is. It's useful for testing purposes.
      #
      # @since 0.1.0
      class Params < BaseParams
        include Hanami::V1::Validations::Form

        # Returns true if no validation errors are found,
        # false otherwise.
        #
        # @return [TrueClass, FalseClass]
        #
        # @since 0.7.0
        #
        # @example
        #   params.valid? # => true
        def valid?
          errors.empty?
        end

        # Serialize params to Hash
        #
        # @return [::Hash]
        #
        # @since 0.3.0
        def to_h
          @params
        end
        alias_method :to_hash, :to_h

        private

        # @api private
        def _params
          _router_params.merge(@result.output)
        end
      end
    end
  end
end
