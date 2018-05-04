module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#externalDocumentationObject
  class ExternalDocumentation
    attr_accessor :description, :url

    def initialize(description: nil, url:)
      self.description = description
      self.url = url
    end
  end
end
