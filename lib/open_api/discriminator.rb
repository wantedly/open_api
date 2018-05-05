module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#discriminatorObject
  class Discriminator
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

    private

    attr_accessor :other_fields_hash
  end
end
