module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#security-requirement-object
  class SecurityRequirement
    extend Forwardable

    def initialize(**hash)
      self.hash = hash.with_indifferent_access
    end

    def_delegator :hash, :[]

    def self.load(hash)
      new(hash)
    end

    private

    attr_accessor :hash
  end
end
