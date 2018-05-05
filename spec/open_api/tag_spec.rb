RSpec.describe OpenApi::Tag do
  it "creates an instance" do
    expect(
      described_class.new(
        name: "pet",
        description: "Pets operations",
      )
    ).to be_a(described_class)
  end

end
