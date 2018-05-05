module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#pathsObject
  class Paths
    extend Forwardable

    def initialize(**path_hash)
      self.path_hash = path_hash.with_indifferent_access
    end

    def_delegator :path_hash, :[]

    def self.load(hash)
      new(hash)
    end

    private

    attr_accessor :path_hash
  end
end
