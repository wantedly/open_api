RSpec.describe OpenApi::ServerVariable do
  it "creates an instance" do
    expect(
      described_class.new(
        enum: ["8443", "443"],
        default: "433",
        description: "port number",
      )
    ).to be_a(described_class)
  end
end
