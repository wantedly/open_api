module OpenApi
  class Components
    prepend EquatableAsContent

    attr_accessor :schemas, :responses, :parameters, :examples, :request_bodies, :headers, :security_schemes, :links, :callbacks

    def initialize(schemas: nil, responses: nil, parameters: nil, examples: nil, request_bodies: nil, headers: nil, security_schemes: nil, links: nil, callbacks: nil)
      self.schemas = schemas
      self.responses = responses
      self.parameters = parameters
      self.examples = examples
      self.request_bodies = request_bodies
      self.headers = headers
      self.security_schemes = security_schemes
      self.links = links
      self.callbacks = callbacks
    end

    def self.load(hash)
      return unless hash

      new(
        schemas: hash["schemas"]&.map { |k, v| [k, Reference.load(v) || Schema.load(v)] }&.to_h,
        responses: hash["responses"]&.map { |k, v| [k, Reference.load(v) || Response.load(v)] }&.to_h,
        parameters: hash["parameters"]&.map { |k, v| [k, Reference.load(v) || Parameter.load(v)] }&.to_h,
        examples: hash["examples"]&.map { |k, v| [k, Reference.load(v) || Example.load(v)] }&.to_h,
        request_bodies: hash["requestBodies"]&.map { |k, v| [k, Reference.load(v) || RequestBody.load(v)] }&.to_h,
        headers: hash["headers"]&.map { |k, v| [k, Reference.load(v) || Header.load(v)] }&.to_h,
        security_schemes: hash["securitySchemes"]&.map { |k, v| [k, Reference.load(v) || SecuritySchema.load(v)] }&.to_h,
        links: hash["links"]&.map { |k, v| [k, Reference.load(v) || Link.load(v)] }&.to_h,
        callbacks: hash["callbacks"]&.map { |k, v| [k, Reference.load(v) || Callback.load(v)] }&.to_h,
      )
    end
  end
end
