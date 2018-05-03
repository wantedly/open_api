module OpenApi
  class Responses
    extend Forwardable
    prepend EquatableAsContent

    attr_accessor :default

    def initialize(default: nil, **responses_hash)
      self.default = default
      self.responses_hash = responses_hash.with_indifferent_access
    end

    def_delegator :responses_hash, :[]

    private

    attr_accessor :responses_hash
  end
end
