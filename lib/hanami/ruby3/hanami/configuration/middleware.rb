module Hanami
  class Configuration
    class Middleware
      def use(middleware, *args, **kwargs, &blk)
        @middleware.push([middleware, args, kwargs, blk])
      end
    end
  end
end
