module OpenApi
  class Response
    prepend EquatableAsContent

    attr_accessor :description, :headers, :content, :links

    def initialize(description:, headers: nil, content: nil, links: nil)
      self.description = description
      self.headers = headers
      self.content = content
      self.links = links
    end
  end
end
