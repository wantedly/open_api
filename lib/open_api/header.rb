module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#header-object
  class Header
    attr_accessor :description, :required, :deprecated, :allow_empty_value

    def initialize(description: nil, required: false, deprecated: nil, allow_empty_value: false, **other_fields_hash)
      self.description = description
      self.required = required
      self.deprecated = deprecated
      self.allow_empty_value = allow_empty_value
      self.other_fields_hash = other_fields_hash.with_indifferent_access

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
