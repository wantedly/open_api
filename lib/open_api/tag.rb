module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#tagObject
  class Tag
    prepend EquatableAsContent

    attr_accessor :name, :description, :external_docs

    def initialize(name:, description: nil, external_docs: nil)
      self.name = name
      self.description = description
      self.external_docs = external_docs
    end

    def self.load(hash)
      return unless hash

      new(
        name: hash["name"].to_s,
        description: hash["description"]&.to_s,
        external_docs: ExternalDocumentation.load(hash["externalDocs"]),
      )
    end
  end
end
