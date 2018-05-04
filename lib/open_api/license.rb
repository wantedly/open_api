module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#license-object
  class License
    attr_accessor :name, :url

    def initialize(name:, url: nil)
      self.name = name
      self.url = url
    end
  end
end
