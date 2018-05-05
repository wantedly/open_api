module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#security-scheme-object
  class SecuritySchema
    attr_accessor :type, :description, :name, :in, :scheme, :bearer_format, :flows, :open_id_connect_url

    def initialize(type:, description: nil, name:, in:, scheme:, bearer_format: nil, flows:, open_id_connect_url:)
      self.type = type
      self.description = description
      self.name = name
      self.in = binding.local_variable_get(:in)
      self.scheme = scheme
      self.bearer_format = bearer_format
      self.flows = flows
      self.open_id_connect_url = open_id_connect_url
    end
  end
end
