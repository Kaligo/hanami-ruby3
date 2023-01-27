# TODO: remove when https://github.com/hanami/controller/pull/339 is merged
module Hanami
  module Action
    module Rack
      module InstanceMethods
        def initialize(*, **)
          super
          @_status = nil
          @_body   = nil
        end
      end

      module ClassMethods
        def use(middleware, *args, **kwargs, &block)
          rack_builder.use(middleware, *args, **kwargs, &block)
        end
      end
    end
  end
end
