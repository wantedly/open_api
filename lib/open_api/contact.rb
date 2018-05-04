module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#contactObject
  class Contact
    attr_accessor :name, :url, :email

    def initialize(name: nil, url: nil, email: nil)
      self.name = name
      self.url = url
      self.email = email
    end
  end
end
