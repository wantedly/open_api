module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#discriminatorObject
  class Discriminator
    prepend EquatableAsContent

    attr_accessor :property_name, :mapping

    def initialize(property_name: nil, mapping: {}, **other_fields_hash)
      self.property_name = property_name
      self.mapping = mapping.with_indifferent_access
      self.other_fields_hash = other_fields_hash

      other_fields_hash.keys.each do |field_name|
        define_singleton_method(field_name) do
          other_fields_hash[field_name]
        end
        define_singleton_method("#{field_name}=") do |value|
          other_fields_hash[field_name] = value
        end
      end
    end

    def self.load(hash)
      return unless hash

      fixed_field_names = %w(propertyName mapping)
      other_fields_hash = hash.reject { |key| key.to_s.in?(fixed_field_names) }

      new(
        property_name: hash["propertyName"].to_s,
        mapping: hash["mapping"],
        **other_fields_hash.symbolize_keys,
      )
    end

    private

    attr_accessor :other_fields_hash
  end
end
