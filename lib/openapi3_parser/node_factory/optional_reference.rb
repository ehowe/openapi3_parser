# frozen_string_literal: true

require "openapi3_parser/node_factory/reference"

module Openapi3Parser
  module NodeFactory
    class OptionalReference
      def initialize(factory)
        @factory = factory
      end

      def call(context)
        reference = context.input.is_a?(Hash) && context.input["$ref"]

        if reference
          NodeFactory::Reference.new(context, self)
        else
          factory.new(context)
        end
      end

      private

      attr_reader :factory
    end
  end
end
