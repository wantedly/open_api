module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#path-item-object
  class PathItem
    prepend EquatableAsContent

    attr_accessor :ref, :summary, :description, :servers, :parameters, :operations

    OPERATION_NAMES = [:get, :put, :post, :delete, :options, :head, :patch, :trace]

    def initialize(ref: nil, summary: nil, description: nil, servers: nil, parameters: nil, **operations)
      self.ref = ref
      self.summary = summary
      self.description = description
      self.servers = servers
      self.parameters = parameters
      self.operations = operations.map { |k, v| [k.to_s.underscore.to_sym, v] }.to_h
    end

    def serializable_hash
      {
        "ref" => ref&.to_s,
        "summary" => summary&.to_s,
        "description" => description&.to_s,
        "servers" => servers&.map(&:serializable_hash),
        "parameters" => parameters&.map(&:serializable_hash),
      }.merge(operations.map { |k, v| [k.to_s.underscore, v.serializable_hash] }.to_h)
       .compact
    end

    def self.load(hash)
      operations = hash.select { |key| key.to_sym.in?(OPERATION_NAMES) }
      new(
        ref: hash["$ref"]&.to_s,
        summary: hash["summary"]&.to_s,
        description: hash["description"]&.to_s,
        servers: hash["servers"]&.map { |server_hash| Server.load(server_hash) },
        parameters: hash["parameters"]&.map { |h| Reference.load(h) || Parameter.load(h) },
        **operations.map { |k ,v| [k.to_sym, Operation.load(v)] }.to_h,
      )
    end
  end
end
