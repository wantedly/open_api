module OpenApi
  module Serializers
    class YamlSerializer < BaseSerializer
      class InfoSerializer
        attr_accessor :contact_serializer, :license_serializer

        def initialize(contact_serializer:, license_serializer:)
          self.contact_serializer = contact_serializer
          self.license_serializer = license_serializer
        end

        def serializable_hash(info)
          {
            "title" => info.title,
            "termsOfService" => info.terms_of_service,
            "contact" => contact_serializer.serialize(info.contact),
            "license" => license_serializer.serialize(info.license),
            "version" => info.version,
          }.compact
        end

        def deserialize(string)
          hash = YAML.load(string)
          Info.new(
            title: hash["title"],
            terms_of_service: hash["termsOfService"],
            contact: contact_serializer.deserialize(hash["contact"]),
            license: license_serializer.deserialize(hash["license"]),
            version: hash["version"]
          )
        end
      end
    end
  end
end
