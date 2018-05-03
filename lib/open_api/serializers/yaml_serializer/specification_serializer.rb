module OpenApi
  module Serializers
    class YamlSerializer < BaseSerializer
      class SpecificationSerializer
        attr_accessor :info_serializer, :paths_serializer, :components_serializer, :security_requirement_serializer, :tag_serializer, :external_documentation_serializer

        def initialize(info_serializer:, paths_serializer:, components_serializer:, security_requirement_serializer:, tag_serializer:, external_documentation_serializer:)
          self.info_serializer = info_serializer
          self.paths_serializer = paths_serializer
          self.components_serializer = components_serializer
          self.security_requirement_serializer = security_requirement_serializer
          self.tag_serializer = tag_serializer
          self.external_documentation_serializer = external_documentation_serializer
        end

        def serialize(specification)
          YAML.dump(serializable_hash(specification))
        end

        def deserialize(string)
          hash = YAML.load(string)
          OpenApi::Specification.new(
            openapi: hash["openapi"],
            info: info_serializer.deserialize(hash["info"]),
            paths: paths_serializer.deserialize(hash["paths"]),
            components: components_serializer.deserialize(hash["components"]),
            security: hash["security"]&.map { |requirement|
              security_requirement_serializer.deserialize(requirement)
            },
            tags: hash["tags"]&.map { |tag| tag_serializer.deserialize(tag) },
            external_docs: external_documentation_serializer.deserialize(hash["externalDocs"]),
          )
        end

        def serializable_hash(specification)
          {
            "openapi" => specification.openapi.to_s,
            "info" => info_serializer.serialize(specification.info),
            "paths" => paths_serializer.serialize(specification.paths),
            "components" => components_serializer.serialize(specification.components),
            "security" => specification.security.map { |security_requirement|
              security_requirement_serializer.serialize(security_requirement)
            },
            "tags" => specification.tags.map { |tag| tag_serializer.serialize(tag) },
            "externalDocs" => external_documentation_serializer.serialize(specification.external_docs),
          }.compact
        end
      end
    end
  end
end
