module OpenApi
  class Encoding
    # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#encodingObject
    attr_accessor :content_type, :headers, :style, :explode, :allow_reserved

    def initialize(content_type: nil, headers: nil, style: nil, explode: nil, allow_reserved: false)
      self.content_type = content_type
      self.headers = headers
      self.style = style
      self.explode = explode
      self.allow_reserved = allow_reserved
    end
  end
end
