module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#referenceObject
  class Reference
    prepend EquatableAsContent

    attr_accessor :ref
    def initialize(ref:)
      self.ref = ref
    end
  end
end
