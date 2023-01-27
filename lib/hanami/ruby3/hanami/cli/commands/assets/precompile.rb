require 'hanami/cli/commands/command'

# TODO: remove once Hanami supports ruby 3.0
module Hanami
  class CLI
    module Commands
      module Assets
        # @since 1.1.0
        # @api private
        class Precompile < ::Hanami::CLI::Commands::Command
          # @since 1.1.0
          # @api private
          def call(*, **options)
            context = Context.new(options: options)

            precompile_assets(context)
          end
        end
      end
    end
  end
end
