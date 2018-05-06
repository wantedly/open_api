module OpenApi
  class Operation
    prepend EquatableAsContent

    attr_accessor :tags, :summary, :description, :external_docs, :operation_id, :parameters, :request_body, :responses, :callbacks, :deprecated, :security, :servers

    def initialize(responses:, tags: nil, summary: nil, description: nil, external_docs: nil, operation_id: nil, parameters: nil, request_body: nil, callbacks: nil, deprecated: nil, security: nil, servers: nil)
      self.responses = responses
      self.tags = tags
      self.summary = summary
      self.description = description
      self.external_docs = external_docs
      self.operation_id = operation_id
      self.parameters = parameters
      self.request_body = request_body
      self.callbacks = callbacks
      self.deprecated = deprecated
      self.security = security
      self.servers = servers
    end

    def self.load(hash)
      return unless hash

      new(
        responses: Responses.load(hash["responses"]),
        tags: hash["tags"],
        summary: hash["summary"]&.to_s,
        description: hash["description"].to_s,
        external_docs: ExternalDocumentation.load(hash["externalDocs"]),
        operation_id: hash["operationId"]&.to_s,
        parameters: hash["parameters"]&.map { |h| Reference.load(h) || Parameter.load(h) },
        request_body: Reference.load(hash["requestBody"]) || RequestBody.load(hash["requestBody"]),
        callbacks: hash["callbacks"]&.map { |k, v| [k, Reference.load(v) || Callback.load(v)] }&.to_h,
        deprecated: hash["deprecated"],
        security: hash["security"]&.map { |h| SecurityRequirement.load(h) },
        servers: hash["servers"]&.map { |h| Server.load(h) },
      )
    end
  end
end
