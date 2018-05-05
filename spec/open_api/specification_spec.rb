RSpec.describe OpenApi::Specification do
  it "creates instance" do
    expect(
      described_class.new(
        openapi: "3.0.1",
        info: double(:info),
        paths: double(:path),
      )
    ).to be_a(described_class)
  end

  describe "#serializable_hash" do
    subject { spec.serializable_hash }

    let(:spec) do
      dummy_object = double(:object)
      allow(dummy_object).to receive(:serializable_hash).and_return("dummy")
      described_class.new(
        openapi: "3.0.1",
        info: dummy_object,
        paths: dummy_object,
      )
    end

    it "returns serializable hash" do
      is_expected.to eq(
        {
          "openapi" => "3.0.1",
          "info" => "dummy",
          "paths" => "dummy",
        }
      )
    end
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "openapi" => "3.0.1",
        "info" => "dummy",
        "paths" => "dummy",
        "components" => "dummy",
        "security" => ["dummy"],
        "tags" => ["dummy"],
        "externalDocs" => "dummy",
      }
    end
    let(:dummy_object) { double(:dummy_object) }

    before do
      allow(OpenApi::Info).to receive(:load).and_return(dummy_object)
      allow(OpenApi::Paths).to receive(:load).and_return(dummy_object)
      allow(OpenApi::Tag).to receive(:load).and_return(dummy_object)
      allow(OpenApi::Components).to receive(:load).and_return(dummy_object)
      allow(OpenApi::SecurityRequirement).to receive(:load).and_return(dummy_object)
      allow(OpenApi::ExternalDocumentation).to receive(:load).and_return(dummy_object)
    end

    it "creates an instance from a hash" do
      is_expected.to eq(
        described_class.new(
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
