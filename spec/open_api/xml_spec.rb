RSpec.describe OpenApi::Xml do
  it "creates an instance" do
    expect(
      described_class.new(
        name: "animal"
      )
    ).to be_a(described_class)
  end
end
