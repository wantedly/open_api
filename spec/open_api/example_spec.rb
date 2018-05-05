RSpec.describe OpenApi::Example do
  it "returns an instance" do
    expect(
      described_class.new(
        summary: "Short description",
        description: "Long description",
        value: 1,
        external_value: nil,
      )
    ).to be_a(described_class)
  end
end
