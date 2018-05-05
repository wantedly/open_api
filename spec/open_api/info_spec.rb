RSpec.describe OpenApi::Info do
  it "creates instance" do
    expect(
      described_class.new(
        title: "Awesome API",
        version: "1.0.0",
      )
    ).to be_a(described_class)
  end

  describe "#serializable_hash" do
    subject { info.serializable_hash }

    let(:info) do
      dummy_object = double(:dummy)
      allow(dummy_object).to receive(:serializable_hash).and_return("dummy")
      described_class.new(
        title: "Awesome API",
        description: "This API provides brabrabra...",
        terms_of_service: "https://example.com/terms",
        contact: dummy_object,
        license: dummy_object,
        version: "1.0.0",
      )
    end

    it "returns serializable hash" do
      is_expected.to eq(
        {
          "title" => "Awesome API",
          "description" => "This API provides brabrabra...",
          "termsOfService" => "https://example.com/terms",
          "contact" => "dummy",
          "license" => "dummy",
          "version" => "1.0.0",
        }
      )
    end
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "title" => "Awesome API",
        "description" => "This API provides brabrabra...",
        "termsOfService" => "https://example.com/terms",
        "contact" => "dummy contact",
        "license" => "dummy license",
        "version" => "1.0.0",
      }
    end
    let(:contact) { double(:contact) }
    let(:license) { double(:license) }

    before do
      allow(OpenApi::Contact).to receive(:load).and_return(contact)
      allow(OpenApi::License).to receive(:load).and_return(license)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        title: "Awesome API",
        description: "This API provides brabrabra...",
        terms_of_service: "https://example.com/terms",
        contact: contact,
        license: license,
        version: "1.0.0"
      )
    end
  end
end
