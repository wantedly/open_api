module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#server-variable-object
  class ServerVariable
    attr_accessor :enum, :default, :description

    def initialize(enum: nil, default:, description: nil)
      self.enum = enum
      self.default = default
      self.description = description
    end
  end
end
