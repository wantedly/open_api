module OpenApi
  class RequestBody
    prepend EquatableAsContent

    attr_accessor :description, :content, :required

    def initialize(description: nil, content:, required: false)
      self.description = description
      self.content = content.with_indifferent_access
      self.required = required
    end

    def self.load(hash)
      new(
        description: hash["description"],
        content: hash["content"].map { |k, v| [k, MediaType.load(v)] }.to_h,
        required: hash["required"].nil? ? false : hash["required"]
      )
    end
  end
end
