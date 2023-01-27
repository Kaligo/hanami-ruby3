require 'hanami/utils/basic_object'
require 'hanami/view/escape'

module Hanami
  module View
    module Rendering
      class LayoutScope < Utils::BasicObject
        protected

          # Forward all the missing methods to the view scope or to the layout.
          #
          # @api private
          # @since 0.1.0
          #
          # @see Hanami::View::Rendering::Scope
          # @see Hanami::Layout
          #
          # @example
          #   # In the layout template:
          #   #   templates/application.html.erb
          #   #
          #   # Use like this:
          #   <title><%= article.title %></title>
          #
          #   # `article` will be looked up in the view scope first.
          #   # If not found, it will be searched within the layout.
          # rubocop:disable Style/MissingRespondToMissing, Lint/DuplicateBranch
          def method_missing(m_name, *args, **kwargs, &blk)
            # FIXME: this isn't compatible with Hanami 2.0, as it extends a view
            # that we want to be frozen in the future
            #
            # See https://github.com/hanami/view/issues/130#issuecomment-319326236
            if @scope.respond_to?(m_name, true) && @scope.locals.key?(m_name) && layout.respond_to?(m_name, true)
              layout.__send__(m_name, *args, **kwargs, &blk)
            elsif @scope.respond_to?(m_name, true)
              @scope.__send__(m_name, *args, **kwargs, &blk)
            elsif layout.respond_to?(m_name, true)
              layout.__send__(m_name, *args, **kwargs, &blk)
            else
              ::Hanami::View::Escape.html(super)
            end
          end
        # rubocop:enable Style/MissingRespondToMissing, Lint/DuplicateBranch
      end
    end
  end
end
