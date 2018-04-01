# frozen_string_literal: true

require "openapi3_parser/node_factories/request_body"
require "openapi3_parser/node/request_body"

require "support/node_object_factory"
require "support/helpers/context"

RSpec.describe Openapi3Parser::NodeFactories::RequestBody do
  include Helpers::Context

  it_behaves_like "node object factory", Openapi3Parser::Node::RequestBody do
    let(:input) do
      {
        "description" => "user to add to the system",
        "content" => {
          "text/plain" => {
            "schema" => {
              "type" => "array",
              "items" => { "type" => "string" }
            }
          }
        }
      }
    end

    let(:context) { create_context(input) }
  end

  describe "content" do
    subject { described_class.new(context) }
    let(:context) { create_context("content" => content) }

    context "when content is an empty hash" do
      let(:content) { {} }

      it do
        is_expected
          .to have_validation_error("#/content")
          .with_message("Expected to have at least 1 item")
      end
    end

    context "when content has a valid media type" do
      let(:content) do
        {
          "application/json" => {}
        }
      end

      it { is_expected.to be_valid }
    end

    context "when content has a valid media type range" do
      let(:content) do
        {
          "text/*" => {}
        }
      end

      it { is_expected.to be_valid }
    end

    context "when content has an invalid valid media type" do
      let(:content) do
        {
          "bad-media-type" => {}
        }
      end

      it do
        is_expected
          .to have_validation_error("#/content/bad-media-type")
          .with_message(%("bad-media-type" is not a valid media type))
      end
    end
  end
end
