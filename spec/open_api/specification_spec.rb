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
end
