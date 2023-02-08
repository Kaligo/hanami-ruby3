# TODO: remove when Hanami supports ruby 3.0
module Hanami
  class Configuration
    def logger(*args, **kwargs)
      if args.empty? && kwargs.empty?
        settings.fetch(:logger, nil)
      # NOTE: Custom logger definition support, like:
      # environment :test do
      #   logger Logger.new(level: :fatal)
      elsif kwargs.empty?
        settings[:logger] = [*args]
      # NOTE: Hash-based logger definition support, like:
      # environment :test do
      #   logger level: :fatal
      else
        settings[:logger] = [*args, kwargs]
      end
    end
  end
end
