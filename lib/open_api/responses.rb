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

    def self.load(hash)
      return unless hash

      hash = hash.map { |k, v| [k.to_s.to_sym, Response.load(v)] }.to_h
      new(**hash)
    end

    private

    attr_accessor :responses_hash
  end
end
