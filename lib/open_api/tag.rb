module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#tagObject
  class Tag
    attr_accessor :name, :description, :external_docs

    def initialize(name:, description: nil, external_docs: nil)
      self.name = name
      self.description = description
      self.external_docs = external_docs
    end
  end
end
