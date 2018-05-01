RSpec.describe OpenApi::Response do
  let(:content) do
    {
      "application/json" => media_type,
    }
  end
  let(:media_type) { double(:media_type) }

  it "creates an instance" do
    expect(
      described_class.new(
        description: "A book object",
        content: content,
      )
    ).to be_a(described_class)
  end
end
