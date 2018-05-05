module OpenApi
  class Response
    prepend EquatableAsContent

    attr_accessor :description, :headers, :content, :links

    def initialize(description:, headers: nil, content: nil, links: nil)
      self.description = description
      self.headers = headers.with_indifferent_access
      self.content = content.with_indifferent_access
      self.links = links.with_indifferent_access
    end

    def self.load(hash)
      new(
        description: hash["description"].to_s,
        headers: hash["headers"]&.map { |k, v| [k, Header.load(v)] }.to_h,
        content: hash["content"]&.map { |k, v| [k, MediaType.load(v)] }.to_h,
        links: hash["links"]&.map { |k, v| [k, Reference.load(v) || Link.load(v)] }.to_h,
      )
    end
  end
end
