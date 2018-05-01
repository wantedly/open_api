module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#oasObject
  class Specification
    attr_accessor :openapi, :info, :servers, :paths, :components, :security, :tags, :external_docs

    def initialize(openapi:, info:, servers: nil, paths:, components: nil, security: nil, tags: nil, external_docs: nil)
      self.openapi = openapi
      self.info = info
      self.paths = paths
      self.components = components
      self.security = security
      self.tags = tags
      self.external_docs = external_docs
    end
  end
end
