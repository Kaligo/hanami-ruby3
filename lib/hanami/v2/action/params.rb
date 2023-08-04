require 'dry/validation'
require 'hanami/v2/action/base_params'
require 'hanami/v1/action/params/errors'

module Hanami
  module V2
    module Action
      class Params < Dry::Validation::Contract
        option :rack_params

        def self.new(rack_env, **options)
          super(rack_params: Hanami::V2::Action::BaseParams.new(rack_env), **options)
        end

        def error_messages(error_set = errors)
          error_set.to_h.flat_map do |key, messages|
            if messages.is_a?(Hash)
              { key => error_messages(messages) }
            else
              messages.map { |text| "#{Utils::String.titleize(key)} #{text}".strip }
            end
          end
        end

        def [](key)
          to_h[key]
        end

        def to_h
          @to_h ||= result.to_h
        end
        alias output to_h

        def valid?
          result.success?
        end

        def validate
          result
        end

        def result
          @result ||= call(rack_params.to_h)
        end

        def errors
          @errors ||= Hanami::V1::Action::Params::Errors.new(result.errors)
        end
      end
    end
  end
end
