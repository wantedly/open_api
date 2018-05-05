module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#server-object
  class Server
    prepend EquatableAsContent

    attr_accessor :url, :description, :variables

    def initialize(url:, description: nil, variables: nil)
      self.url = url
      self.description = description
      self.variables = variables
    end

    def self.load(hash)
      new(
        url: hash["url"].to_s,
        description: hash["description"]&.to_s,
        variables: hash["variables"]&.map { |h| ServerVariable.load(h) }
      )
    end
  end
end
