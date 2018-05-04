module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#server-object
  class Server
    attr_accessor :url, :description, :variables

    def initialize(url:, description: nil, variables: nil)
      self.url = url
      self.description = description
      self.variables = variables
    end
  end
end
