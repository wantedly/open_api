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
      self.operations = operations.with_indifferent_access
    end
  end
end
