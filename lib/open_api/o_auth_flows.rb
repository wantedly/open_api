module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#oauth-flows-object
  class OAuthFlows
    prepend EquatableAsContent

    attr_accessor :implicit, :password, :client_credentials, :authorization_code

    def initialize(implicit: nil, password: nil, client_credentials: nil, authorization_code: nil)
      self.implicit = implicit
      self.password = password
      self.client_credentials = client_credentials
      self.authorization_code = authorization_code
    end

    def self.load(hash)
      return unless hash

      new(
        implicit: OAuthFlow.load(hash["implicit"]),
        password: OAuthFlow.load(hash["password"]),
        client_credentials: OAuthFlow.load(hash["clientCredentials"]),
        authorization_code: OAuthFlow.load(hash["authorizationCode"]),
      )
    end
  end
end
