module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#referenceObject
  class Reference
    prepend EquatableAsContent

    attr_accessor :ref
    def initialize(ref:)
      self.ref = ref
    end

    def self.load(hash)
      return nil unless hash["$ref"]

      new(ref: hash["$ref"])
    end
  end
end
