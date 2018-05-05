module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#contactObject
  class Contact
    prepend EquatableAsContent

    attr_accessor :name, :url, :email

    def initialize(name: nil, url: nil, email: nil)
      self.name = name
      self.url = url
      self.email = email
    end

    def self.load(hash)
      new(
        name: hash["name"]&.to_s,
        url: hash["url"]&.to_s,
        email: hash["email"]&.to_s,
      )
    end
  end
end
