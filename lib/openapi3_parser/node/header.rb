# frozen_string_literal: true

require "openapi3_parser/node/object"
require "openapi3_parser/node/parameter_like"

module Openapi3Parser
  module Node
    # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#headerObject
    class Header < Node::Object
      include ParameterLike
    end
  end
end
