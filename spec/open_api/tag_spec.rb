RSpec.describe OpenApi::Tag do
  it "creates an instance" do
    expect(
      described_class.new(
        name: "pet",
        description: "Pets operations",
      )
    ).to be_a(described_class)
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "name" => "pet",
        "description" => "Pets operations",
        "externalDocs" => external_docs_hash,
      }
    end
    let(:external_docs_hash) { double(:hash) }
    let(:external_docs) { double(:external_documentation) }

    before do
      allow(OpenApi::ExternalDocumentation).to receive(:load).with(external_docs_hash).and_return(external_docs)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        name: "pet",
        description: "Pets operations",
        external_docs: external_docs,
      )
    end
  end

end
