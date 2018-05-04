RSpec.describe OpenApi::Contact do
  it "creates an instance" do
    expect(
      described_class.new(
        name: "API Support",
        url: "http://www.example.com/support",
        email: "support@example.com"
      )
    ).to be_a(described_class)
  end
end
