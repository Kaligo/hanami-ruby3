module Hanami
  module Components
    # NOTE: Monkey-patch Hanami console to avoid reloading lib folder.
    # So that it does not interfere with ROM::Struct & Dry::Validation::Contract
    register 'code' do
      run do
        directory = Hanami.root.join('lib')
        Utils.require!(directory)
      end
    end

    # NOTE: Hanami 1.3 does not support Ruby 3.0, and there is no plan to add
    # official support just yet. Monkey Patching for now
    #
    register 'logger' do
      prepare do
        require 'hanami/logger'

        resolve do |configuration|
          if configuration.logger.is_a?(Array)
            if logger_interface?(configuration.logger.first)
              configuration.logger.first
            else
              kwargs = configuration.logger.last
              Hanami::Logger.new(Hanami.environment.project_name, *configuration.logger, **kwargs)
            end
          else
            Hanami::Logger.new(Hanami.environment.project_name, **configuration.logger)
          end
        end
      end
    end
  end
end
