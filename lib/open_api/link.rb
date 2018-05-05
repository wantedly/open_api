module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#link-object
  class Link
    attr_accessor :operation_ref, :operation_id, :parameters, :request_body, :description, :server

    def initialize(operation_ref: nil, operation_id: nil, parameters: nil, request_body: nil, description: nil, server: nil, **other_fields_hash)
      self.operation_ref = operation_ref
      self.operation_id = operation_id
      self.parameters = parameters
      self.request_body = request_body
      self.description = description
      self.server = server
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
