RSpec.describe OpenApi::Server do
  it "creates an instance" do
    expect(
      described_class.new(
        "url": "https://example.com/v1",
        "description": "Development server"
      )
    ).to be_a(described_class)
  end
end
