module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#encodingObject
  class Encoding
    prepend EquatableAsContent

    attr_accessor :content_type, :headers, :style, :explode, :allow_reserved

    def initialize(content_type: nil, headers: nil, style: nil, explode: nil, allow_reserved: false)
      self.content_type = content_type
      self.headers = headers
      self.style = style
      self.explode = explode
      self.allow_reserved = allow_reserved
    end

    def self.load(hash)
      new(
        content_type: hash["contentType"]&.to_s,
        headers: hash["headers"]&.map { |k, v| [k, Reference.load(v) || Header.load(v)] }.to_h,
        style: hash["style"]&.to_s,
        explode: hash["explode"],
        allow_reserved: hash["allowReserved"].nil? ? false : hash["allowReserved"],
      )
    end
  end
end
