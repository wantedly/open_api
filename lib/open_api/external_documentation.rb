module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#externalDocumentationObject
  class ExternalDocumentation
    attr_accessor :description, :url

    def initialize(description: nil, url:)
      self.description = description
      self.url = url
    end

    def self.load(hash)
      return unless hash

      new(
        description: hash["description"]&.to_s,
        url: hash["url"].to_s,
      )
    end
  end
end
