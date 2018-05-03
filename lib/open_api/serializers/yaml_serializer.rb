require 'yaml'
require 'open_api/serializers/yaml_serializer/specification_serializer'
require 'open_api/serializers/yaml_serializer/info_serializer'

module OpenApi
  module Serializers
    class YamlSerializer < BaseSerializer
      attr_accessor :specification_serializer

      def initialize
        dummy_serializer = DummySerializer.new
        self.specification_serializer = SpecificationSerializer.new(
          info_serializer: dummy_serializer, # TODO: Replace real one
          paths_serializer: dummy_serializer, # TODO: Replace real one
          components_serializer: dummy_serializer, # TODO: Replace real one
          security_requirement_serializer: dummy_serializer, # TODO: Replace real one
          tag_serializer: dummy_serializer, # TODO: Replace real one
          external_documentation_serializer: dummy_serializer, # TODO: Replace real one
        )
      end

      def serialize(object)
        hash = specification_serializer.serializable_hash(object)
        YAML.dump(hash)
      end

      def deserialize(yaml_string)
        hash = YAML.load(yaml_string)
        hash = hash.with_indifferenct_access
        specification_serializer.deserialize(hash)
      end

      class DummySerializer
        def serializable_hash(object)
          return nil unless object
          "TODO"
        end

        def deserialize(string)
          Object.new
        end
      end
    end
  end
end
