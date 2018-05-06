module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#pathsObject
  class Paths
    extend Forwardable
    prepend EquatableAsContent

    def initialize(**path_hash)
      self.path_hash = path_hash.with_indifferent_access
    end

    def_delegator :path_hash, :[]

    def self.load(hash)
      hash = hash.map { |k, v| [k.to_sym, PathItem.load(v)] }.to_h
      new(**hash)
    end

    def serializable_hash
      path_hash.map { |k, v| [k.to_s, v.serializable_hash] }.to_h
    end

    private

    attr_accessor :path_hash
  end
end
