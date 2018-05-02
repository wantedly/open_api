module OpenApi
  class RequestBody
    attr_accessor :description, :content, :required

    def initialize(description: nil, content:, required: false)
      self.description = description
      self.content = content.with_indifferent_access
      self.required = required
    end
  end
end
