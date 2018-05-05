module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#exampleObject
  class Example
    attr_accessor :summary, :description, :value, :external_value

    def initialize(summary: nil, description: nil, value: nil, external_value: nil)
      self.summary = summary
      self.description = description
      self.value = value
      self.external_value = external_value
    end
  end
end
