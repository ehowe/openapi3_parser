# frozen_string_literal: true

require "openapi3_parser/context"
require "openapi3_parser/node_factory/map"
require "openapi3_parser/node_factory/path_item"
require "openapi3_parser/node/callback"

module Openapi3Parser
  module NodeFactory
    class Callback < NodeFactory::Map
      def initialize(context)
        super(context,
              allow_extensions: true,
              value_factory: NodeFactory::PathItem)
      end

      private

      def build_node(data)
        Node::Callback.new(data, context)
      end
    end
  end
end
