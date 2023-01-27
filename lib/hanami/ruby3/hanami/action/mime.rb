module Hanami
  module Action
    module Mime
      module InstanceMethods
        def initialize(*, **)
          super
          @content_type = nil
          @charset      = nil
        end
      end
    end
  end
end
