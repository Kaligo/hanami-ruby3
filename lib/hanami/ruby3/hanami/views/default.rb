require 'hanami/views/default_template_finder'

module Hanami
  module Views
    class Default
      def self.render(root, template_name, context)
        format   = context[:format]
        template = DefaultTemplateFinder.new(self, root, template_name, format).find

        if template
          new(template, **context).render
        else
          super(context)
        end
      end
    end
  end
end
