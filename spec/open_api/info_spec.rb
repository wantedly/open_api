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
end
