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
  end
end
