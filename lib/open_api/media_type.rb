module OpenApi
  class MediaType
    prepend EquatableAsContent

    attr_accessor :schema, :example, :examples, :encoding

    def initialize(schema: nil, example: nil, examples: nil, encoding: nil)
      self.schema = schema
      self.example = example
      self.examples = examples
      self.encoding = encoding
    end
  end
end
