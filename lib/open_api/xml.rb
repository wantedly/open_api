module OpenApi
  # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md#xml-object
  class Xml
    attr_accessor :name, :namespace, :prefix, :attribute, :wrapped

    def initialize(name: nil, namespace: nil, prefix: nil, attribute: false, wrapped: false)
      self.name = name
      self.namespace = namespace
      self.prefix = prefix
      self.attribute = attribute
      self.wrapped = wrapped
    end
  end
end
