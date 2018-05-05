module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#oauth-flows-object
  class OAuthFlows
    attr_accessor :implicit, :password, :client_credentials, :authorization_code

    def initialize(implicit: nil, password: nil, client_credentials: nil, authorization_code: nil)
      self.implicit = implicit
      self.password = password
      self.client_credentials = client_credentials
      self.authorization_code = authorization_code
    end
  end
end
