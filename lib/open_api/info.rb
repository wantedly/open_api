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
  end
end
