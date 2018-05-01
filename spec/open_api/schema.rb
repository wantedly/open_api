module OpenApi
  class Schema
    attr_accessor :nullable, :discriminator, :read_only, :write_only, :xml, :external_docs, :example, :deprecated

    def initialize(nullable: false, discriminator: nil, read_only: false, write_only: false, xml: nil, external_docs: nil, example: nil, deprecated: false, **other_fields_hash)
      self.nullable = nullable
      self.discriminator = discriminator
      self.read_only = read_only
      self.write_only = write_only
      self.xml = xml
      self.external_docs = external_docs
      self.example = example
      self.deprecated = deprecated
      self.other_fields_hash = other_fields_hash.with_indifferent_access

      other_fields_hash.keys.each do |key|
        define_singleton_method(key) do
          other_fields_hash[key]
        end
      end
    end

    private

    attr_accessor :other_fields_hash
  end
end
