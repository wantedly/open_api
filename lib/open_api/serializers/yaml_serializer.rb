require 'yaml'
require 'open_api/serializers/yaml_serializer/specification_serializer'
require 'open_api/serializers/yaml_serializer/info_serializer'

module OpenApi
  module Serializers
    class YamlSerializer < BaseSerializer
      def deserialize(yaml_string)
        hash = YAML.load(yaml_string)
        hash = hash.with_indifferenct_access
        root_serializer.deserialize(hash)
      end

      def root_serializer
        @root_serializer ||= SpecificationSerializer.new
      end
    end
  end
end
