require 'yaml'

module OpenApi
  module Serializers
    class YamlSerializer
      def serialize(specification)
        hash = specification.serializable_hash
        YAML.dump(hash)
      end

      def deserialize(yaml_string)
        hash = YAML.load(yaml_string)
        Specification.load(hash)
      end
    end
  end
end
