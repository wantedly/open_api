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

    def self.load(hash)
      return unless hash

      new(
        schema: Reference.load(hash["schema"]) || Schema.load(hash["schema"]),
        example: hash["example"],
        examples: hash["examples"]&.map { |k, v| [k, Reference.load(v) || Example.load(v)] }.to_h,
        encoding: hash["encodings"]&.map { |k, v| [k, Encoding.load(v)] }.to_h
      )
    end
  end
end
