RSpec.describe OpenApi::Serializers::YamlSerializer::SpecificationSerializer do
  describe "#serializable_hash" do
    subject { serializer.serializable_hash(spec) }

    let(:serializer) do
      dummy_serializer = double(:dummy_serializer)
      allow(dummy_serializer).to receive(:serializable_hash).and_return("dummy string")

      described_class.new(
				info_serializer: dummy_serializer,
				paths_serializer: dummy_serializer,
				components_serializer: dummy_serializer,
				security_requirement_serializer: dummy_serializer,
        tag_serializer: dummy_serializer,
				external_documentation_serializer: dummy_serializer,
      )
    end
    let(:spec) do
      OpenApi::Specification.new(
        openapi: "3.0.1",
        info: double(:info),
        paths: double(:paths),
        components: double(:components),
        security: [double(:security_requirement)],
        tags: [double(:tag)],
        external_docs: double(:external_docs),
      )
    end

    it "returns serializable hash" do
      is_expected.to eq(
        {
          "openapi" => "3.0.1",
          "info" => "dummy string",
          "paths" => "dummy string",
          "components" => "dummy string",
          "security" => ["dummy string"],
          "tags" => ["dummy string"],
          "externalDocs" => "dummy string",
        }
      )
    end
  end

  describe "#deserialize" do
    subject { serializer.deserialize(yaml_string) }

    let(:serializer) do
      dummy_serializer = double(:dummy_serializer)
      allow(dummy_serializer).to receive(:deserialize).and_return(dummy_object)

      described_class.new(
				info_serializer: dummy_serializer,
				paths_serializer: dummy_serializer,
				components_serializer: dummy_serializer,
				security_requirement_serializer: dummy_serializer,
        tag_serializer: dummy_serializer,
				external_documentation_serializer: dummy_serializer,
      )
    end
    let(:dummy_object) { double(:dummy_object) }
    let(:yaml_string) do
      <<~YAML
      ---
      openapi: 3.0.1
      info: dummy string
      paths: dummy string
      components: dummy string
      security:
      - dummy string
      tags:
      - dummy string
      externalDocs: dummy string
      YAML
    end

    it "deserializes specification object" do
      is_expected.to eq(
        OpenApi::Specification.new(
          openapi: "3.0.1",
          info: dummy_object,
          paths: dummy_object,
          components: dummy_object,
          security: [dummy_object],
          tags: [dummy_object],
          external_docs: dummy_object,
        )
      )
    end
  end
end
