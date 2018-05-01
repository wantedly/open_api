module OpenApi
  class Components
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
  end
end
