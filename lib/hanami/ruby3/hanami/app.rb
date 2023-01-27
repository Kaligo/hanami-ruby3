# TODO: remove when Hanami supports ruby 3.0
module Hanami
  class App
    private

      def middleware(configuration, environment)
        builder.use Hanami::CommonLogger, Hanami.logger unless Hanami.logger.nil?
        builder.use Rack::ContentLength

        configuration.middleware.each do |m, args, kwargs, &blk|
          builder.use(m, *args, **kwargs, &blk)
        end

        if configuration.early_hints
          require 'hanami/early_hints'
          builder.use Hanami::EarlyHints
        end

        if (middleware = environment.static_assets_middleware)
          builder.use middleware
        end

        builder.use Rack::MethodOverride
      end
  end
end
