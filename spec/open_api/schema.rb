module OpenApi
  class Schema
    prepend EquatableAsContent

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

      other_fields_hash.keys.each { |name| new_field(name) }
    end

    def method_missing(mid, *args)
      len = args.length
      if mname = mid[/.*(?==\z)/m]
        if len != 1
          raise ArgumentError, "wrong number of arguments (#{len} for 1)", caller(1)
        end
        new_field(mname)
        other_fields_hash[mname] = args[0]
      elsif len == 0
        if other_fields_hash.key?(mname.to_s)
          new_field(mname)
          other_fields_hash[mname]
        end
      else
        begin
          super
        rescue NoMethodError => err
          err.backtrace.shift
          raise
        end
      end
    end

    def new_field(name)
      define_singleton_method(name) { other_fields_hash[name] }
      define_singleton_method("#{name}=") { |value| other_fields_hash[name] = value }
    end

    def serializable_hash
      converted_other_fields_hash = other_fields_hash.map { |k, v|
        value =
          case k.to_sym
          when :items then v.serializable_hash
          else
            v
          end
        [k.to_s, value]
      }.to_h

      {
        "nullable" => nullable == false ? nil : nullable,
        "discriminator" => discriminator&.serializable_hash,
        "readOnly" => read_only == false ? nil : read_only,
        "writeOnly" => write_only == false ? nil : write_only,
        "xml" => xml&.serializable_hash,
        "externalDocs" => external_docs&.serializable_hash,
        "example" => example,
        "deprecated" => deprecated == false ? nil : deprecated,
      }
        .merge(converted_other_fields_hash)
        .compact
    end

    def self.load(hash)
      other_fields_hash = hash.reject { |key|
        key.to_sym.in?([:nullable, :discriminator, :readOnly, :writeOnly, :xml, :externalDocs, :example, :deprecated])
      }.map { |k, v|
        loaded_value =
          case k.to_sym
          when :items then Reference.load(v)
          else
            v
          end

        [k, loaded_value]
      }.to_h

      new(
        nullable: hash["nullable"].nil? ? false : hash["nullable"],
        discriminator: hash["discriminator"],
        read_only: hash["readOnly"].nil? ? false : hash["readOnly"],
        write_only: hash["writeOnly"].nil? ? false : hash["writeOnly"],
        xml: Xml.load(hash["xml"]),
        external_docs: ExternalDocumentation.load(hash["externalDocs"]),
        example: Example.load(hash["example"]),
        deprecated: hash["deprecated"].nil? ? false : hash["deprecated"],
        **other_fields_hash.symbolize_keys,
      )
    end

    private

    attr_accessor :other_fields_hash
  end
end
