module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#oauthFlowObject
  class OAuthFlow
    prepend EquatableAsContent

    attr_accessor :authorization_url, :token_url, :refresh_url ,:scopes

    def initialize(authorization_url:, token_url:, refresh_url: nil, scopes:)
      self.authorization_url = authorization_url
      self.token_url = token_url
      self.refresh_url = refresh_url
      self.scopes = scopes.with_indifferent_access
    end

    def self.load(hash)
      return unless hash

      new(
        authorization_url: hash["authorizationUrl"],
        token_url: hash["tokenUrl"],
        refresh_url: hash["refreshUrl"],
        scopes: hash["scopes"],
      )
    end
  end
end
