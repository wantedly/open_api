RSpec.describe OpenApi::SecurityRequirement do
  it "creates an instance" do
    expect(
      described_class.new(
        "petstore_auth": [
          "write:pets",
          "read:pets"
        ]
      )
    ).to be_a(described_class)
  end

  describe "#[]" do
    subject { security_requirement["petstore_auth"] }

    let(:security_requirement) do
      described_class.new(
        "petstore_auth": [
          "write:pets",
          "read:pets"
        ]
      )
    end

    it "returns paired value" do
      is_expected.to eq [
          "write:pets",
          "read:pets"
        ]
    end
  end
end
