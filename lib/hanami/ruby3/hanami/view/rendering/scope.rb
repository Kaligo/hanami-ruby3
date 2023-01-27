module Hanami
  module View
    module Rendering
      class Scope < LayoutScope

        protected

          # @api private
          # rubocop:disable Style/MissingRespondToMissing
          def method_missing(m_name, *args, **kwargs, &block)
            ::Hanami::View::Escape.html(
              # FIXME: this isn't compatible with Hanami 2.0, as it extends a view
              # that we want to be frozen in the future
              #
              # See https://github.com/hanami/view/issues/130#issuecomment-319326236
              if @view.respond_to?(m_name, true)
                @view.__send__ m_name, *args, **kwargs, &block
              elsif @locals.key?(m_name)
                @locals[m_name]
              else
                super
              end
            )
          end
        # rubocop:enable Style/MissingRespondToMissing
      end
    end
  end
end
