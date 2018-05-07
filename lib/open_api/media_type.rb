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

    def serializable_hash
      {
        "schema" => schema&.serializable_hash,
        "example" => example,
        "examples" => examples&.map { |k, v| [k.to_s, v.serializable_hash] }&.to_hash,
        "encoding" => encoding&.map { |k, v| [k.to_s, v.serializable_hash] }&.to_hash,
      }.compact
    end

    def self.load(hash)
      return unless hash

      new(
        schema: Reference.load(hash["schema"]) || Schema.load(hash["schema"]),
        example: hash["example"],
        examples: hash["examples"]&.map { |k, v| [k, Reference.load(v) || Example.load(v)] }&.to_h,
        encoding: hash["encoding"]&.map { |k, v| [k, Encoding.load(v)] }&.to_h
      )
    end
  end
end
