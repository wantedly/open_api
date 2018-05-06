module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#security-scheme-object
  class SecuritySchema
    prepend EquatableAsContent

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

    def self.load(hash)
      return unless hash

      new(
        type: hash["type"].to_s,
        description: hash["description"]&.to_s,
        name: hash["name"].to_s,
        in: hash["in"].to_s,
        scheme: hash["scheme"].to_s,
        bearer_format: hash["bearerFormat"]&.to_s,
        flows: OAuthFlows.load(hash["flows"]),
        open_id_connect_url: hash["openIdConnectUrl"].to_s,
      )
    end
  end
end
