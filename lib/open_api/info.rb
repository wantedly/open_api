module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#info-object
  class Info
    prepend EquatableAsContent

    attr_accessor :title, :description, :terms_of_service, :contact, :license, :version

    def initialize(title:, description: nil, terms_of_service: nil, contact: nil, license: nil, version:)
      self.title = title
      self.description = description
      self.terms_of_service = terms_of_service
      self.contact = contact
      self.license = license
      self.version = version
    end

    def serializable_hash
      {
        "title" => title.to_s,
        "description" => description.to_s,
        "termsOfService" => terms_of_service.to_s,
        "contact" => contact&.serializable_hash,
        "license" => license&.serializable_hash,
        "version" => version.to_s,
      }.compact
    end

    def self.load(hash)
      new(
        title: hash["title"].to_s,
        description: hash["description"].to_s,
        terms_of_service: hash["termsOfService"].to_s,
        contact: Contanct.load(**hash["contact"]),
        license: License.load(**hash["license"]),
        version: hash["version"].to_s,
      )
    end
  end
end
