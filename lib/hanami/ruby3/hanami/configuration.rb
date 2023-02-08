# TODO: remove when Hanami supports ruby 3.0
module Hanami
  class Configuration
    def logger(*args, **kwargs)
      if args.empty? && kwargs.empty?
        settings.fetch(:logger, nil)
      elsif kwargs.empty?
        settings[:logger] = [*args]
      else
        settings[:logger] = [*args, kwargs]
      end
    end
  end
end
