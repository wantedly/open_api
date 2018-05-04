RSpec.describe OpenApi::ExternalDocumentation do
  it "creates an instance" do
    expect(
      described_class.new(
        description: "Find more info here",
        url: "https://example.com"
      )
    ).to be_a(described_class)
  end
end
